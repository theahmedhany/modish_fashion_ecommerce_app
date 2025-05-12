import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_network_exceptions.dart';
import '../../data/models/order_history_details/order_history_details_model.dart';
import '../../data/repos/order_history_details_repo.dart';
import 'order_history_details_state.dart';

class OrderHistoryDetailsCubit
    extends Cubit<OrderHistoryDetailsState<OrderHistoryDetailsModel>> {
  final OrderHistoryDetailsRepo orderHistoryDetailsRepo;

  OrderHistoryDetailsCubit(this.orderHistoryDetailsRepo) : super(const Idle());

  void emitGetOrderHistoryDetails(String productId) async {
    var data = await orderHistoryDetailsRepo.getOrdersHistoryDetails(productId);
    data.when(
      success: (OrderHistoryDetailsModel orderDetails) {
        emit(OrderHistoryDetailsState.success(orderDetails));
      },
      failure: (ApiErrorModel apiError) {
        emit(OrderHistoryDetailsState.error(apiError as ApiNetworkExceptions));
      },
    );
  }
}
