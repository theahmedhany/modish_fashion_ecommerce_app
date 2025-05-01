import '../models/order_history/order_history_model.dart';
import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';

class OrderHistoryRepo {
  final ApiServices apiServices;

  OrderHistoryRepo(this.apiServices);

  Future<ApiResult<List<OrderHistoryModel>>> getOrdersHistory(
    String appUserId,
  ) async {
    try {
      var response = await apiServices.getOrdersHistory(appUserId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
