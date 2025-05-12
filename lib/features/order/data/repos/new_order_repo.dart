import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../models/new_order/new_order_request_body.dart';
import '../models/new_order/new_order_response.dart';

class NewOrderRepo {
  final ApiServices _apiServices;

  NewOrderRepo(this._apiServices);

  Future<ApiResult<NewOrderResponse>> newOrder(
    NewOrderRequestBody newOrderRequestBody,
  ) async {
    try {
      final response = await _apiServices.newOrder(newOrderRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
