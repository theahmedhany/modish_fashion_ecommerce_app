import '../models/products_model.dart';
import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';

class ProductsRepo {
  final ApiServices apiServices;

  ProductsRepo(this.apiServices);

  Future<ApiResult<ProductsModel>> getProducts(
    int pageIndex,
    int pageSize,
  ) async {
    try {
      var response = await apiServices.getProducts(pageIndex, pageSize);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
