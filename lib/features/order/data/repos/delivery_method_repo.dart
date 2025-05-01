import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../models/delivery_method/delivery_method_model.dart';

class DeliveryMethodRepo {
  final ApiServices apiServices;

  DeliveryMethodRepo(this.apiServices);

  Future<ApiResult<List<DeliveryMethodModel>>> getDeliveryMethods() async {
    try {
      var response = await apiServices.getDeliveryMethods();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
