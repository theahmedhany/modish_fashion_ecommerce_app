import '../../../../core/networking/api_network_exceptions.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../models/search_products_model.dart';

class SearchProductsRepo {
  final ApiServices apiServices;

  SearchProductsRepo(this.apiServices);

  Future<ApiResult<SearchProductsModel>> getProductsBySearch(
    int pageIndex,
    int pageSize,
    String searchedItem,
  ) async {
    try {
      var response = await apiServices.getProductsBySearch(
        pageIndex,
        pageSize,
        searchedItem,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiNetworkExceptions.getDioException(error));
    }
  }
}
