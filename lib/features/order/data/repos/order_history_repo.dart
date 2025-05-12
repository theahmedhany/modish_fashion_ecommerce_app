import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../models/order_history/order_history_model.dart';

class OrderHistoryRepo {
  final ApiServices apiServices;

  OrderHistoryRepo(this.apiServices);

  Future<ApiResult<OrderHistoryResponse>> getOrdersHistory(
    int pageIndex,
    int pageSize,
  ) async {
    try {
      var response = await apiServices.getOrdersHistory(pageIndex, pageSize);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
