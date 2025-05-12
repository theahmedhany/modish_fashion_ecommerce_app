import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../models/order_history_details/order_history_details_model.dart';

class OrderHistoryDetailsRepo {
  final ApiServices apiServices;

  OrderHistoryDetailsRepo(this.apiServices);

  Future<ApiResult<OrderHistoryDetailsModel>> getOrdersHistoryDetails(
    String id,
  ) async {
    try {
      var response = await apiServices.getOrdersHistoryDetails(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
