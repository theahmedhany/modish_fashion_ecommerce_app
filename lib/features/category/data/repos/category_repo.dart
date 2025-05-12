import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../models/category_model/category_model.dart';

class CategoryRepo {
  final ApiServices apiServices;

  CategoryRepo(this.apiServices);

  Future<ApiResult<CategoryModel>> getProductsByCategory(
    int pageIndex,
    int pageSize,
    String categoryId,
  ) async {
    try {
      var response = await apiServices.getProductsByCategory(
        pageIndex,
        pageSize,
        categoryId,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
