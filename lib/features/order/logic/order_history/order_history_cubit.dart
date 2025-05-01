import 'package:bloc/bloc.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_network_exceptions.dart';
import '../../data/models/order_history/order_history_model.dart';
import '../../data/repos/order_history_repo.dart';

import 'order_history_state.dart';

class OrderHistoryCubit
    extends Cubit<OrderHistoryState<List<OrderHistoryModel>>> {
  final OrderHistoryRepo orderHistoryRepo;

  OrderHistoryCubit(this.orderHistoryRepo) : super(const Idle());

  void emitGetOrderHistory(String appUserId) async {
    var data = await orderHistoryRepo.getOrdersHistory(appUserId);

    data.when(
      success: (List<OrderHistoryModel> orderHistoryList) {
        emit(OrderHistoryState.success(orderHistoryList));
      },
      failure: (ApiErrorModel errorModel) {
        emit(OrderHistoryState.error(errorModel as ApiNetworkExceptions));
      },
    );
  }
}
