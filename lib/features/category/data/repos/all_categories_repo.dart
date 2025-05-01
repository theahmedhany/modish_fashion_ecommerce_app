import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../models/all_categories_model/all_categories_model.dart';

class AllCategoriesRepo {
  final ApiServices apiServices;

  AllCategoriesRepo(this.apiServices);

  Future<ApiResult<List<AllCategoriesModel>>> getAllCategories() async {
    try {
      var response = await apiServices.getAllCategories();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
