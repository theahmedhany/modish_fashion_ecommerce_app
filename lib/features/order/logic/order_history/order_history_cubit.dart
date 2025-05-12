import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../data/models/order_history/order_history_model.dart';
import '../../data/repos/order_history_repo.dart';
import 'order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState<OrderHistoryResponse>> {
  final OrderHistoryRepo orderHistoryRepo;

  int currentPage = 1;
  final int pageSize = 10;
  bool hasReachedMax = false;
  bool isLoadingMore = false;
  List<OrderHistoryModel> allOrders = [];

  OrderHistoryCubit(this.orderHistoryRepo) : super(const Idle());

  Future<void> emitGetOrderHistory({bool isInitialLoad = true}) async {
    try {
      debugPrint(
        'Fetching orders - isInitialLoad: $isInitialLoad, currentPage: $currentPage',
      );

      if ((isLoadingMore || hasReachedMax) && !isInitialLoad) {
        debugPrint('Already loading or reached max');
        return;
      }

      isLoadingMore = true;

      if (isInitialLoad) {
        emit(const OrderHistoryState.loading());
        currentPage = 1;
        hasReachedMax = false;
        allOrders.clear();
      }

      final data = await orderHistoryRepo.getOrdersHistory(
        currentPage,
        pageSize,
      );

      data.when(
        success: (OrderHistoryResponse response) {
          debugPrint('Received ${response.orders.length} orders');

          if (isInitialLoad) {
            allOrders = response.orders;
          } else {
            final newOrders =
                response.orders
                    .where(
                      (newOrder) =>
                          !allOrders.any(
                            (existingOrder) =>
                                existingOrder.orderId == newOrder.orderId,
                          ),
                    )
                    .toList();

            debugPrint('Adding ${newOrders.length} new orders');
            allOrders.addAll(newOrders);
          }

          hasReachedMax =
              response.orders.length < pageSize ||
              currentPage >= response.totalPages;

          currentPage++;

          debugPrint('New page: $currentPage, HasReachedMax: $hasReachedMax');

          emit(
            OrderHistoryState.success(
              OrderHistoryResponse(
                orders: List<OrderHistoryModel>.from(allOrders),
                page: currentPage - 1,
                pageSize: response.pageSize,
                totalCount: response.totalCount,
                totalPages: response.totalPages,
              ),
            ),
          );
        },
        failure: (ApiErrorModel errorModel) {
          debugPrint('Error fetching orders: ${errorModel.message}');
          emit(OrderHistoryState.error(errorModel));
        },
      );
    } catch (e) {
      debugPrint('Unexpected error in emitGetOrderHistory: $e');
      emit(OrderHistoryState.error(ApiErrorModel(message: e.toString())));
    } finally {
      isLoadingMore = false;
    }
  }
}
