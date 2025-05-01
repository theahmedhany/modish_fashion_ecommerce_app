import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/category/data/models/all_categories_model/all_categories_model.dart';
import '../../features/category/data/models/category_model/category_model.dart';
import '../../features/details/data/models/product_details_model.dart';
import '../../features/login/data/models/login_request_body.dart';
import '../../features/login/data/models/login_response.dart';
import '../../features/order/data/models/delivery_method/delivery_method_model.dart';
import '../../features/order/data/models/new_order/new_order_request_body.dart';
import '../../features/order/data/models/new_order/new_order_response.dart';
import '../../features/order/data/models/order_history/order_history_model.dart';
import '../../features/order/data/models/order_history_details/order_history_details_model.dart';
import '../../features/products/data/models/products_model.dart';
import '../../features/search/data/models/search_products_model.dart';
import '../../features/signup/data/models/signup_request_body.dart';
import '../../features/signup/data/models/signup_response.dart';
import 'api_constants.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  // Get All Products API
  @GET(ApiConstants.apiProducts)
  Future<ProductsModel> getProducts(
    @Query("pageIndex") int pageIndex,
    @Query("pageSize") int pageSize,
  );

  // Get Products By Category API
  @GET(ApiConstants.apiCategory)
  Future<CategoryModel> getProductsByCategory(
    @Query("pageIndex") int pageIndex,
    @Query("pageSize") int pageSize,
    @Query("CategoryId") String categoryId,
  );

  // Get All Categories API
  @GET(ApiConstants.apiAllCategory)
  Future<List<AllCategoriesModel>> getAllCategories();

  // Get Products By Search API
  @GET(ApiConstants.apiSearch)
  Future<SearchProductsModel> getProductsBySearch(
    @Query("pageIndex") int pageIndex,
    @Query("pageSize") int pageSize,
    @Query("Search") String searchedItem,
  );

  // Get Product Details API
  @GET('${ApiConstants.apiProductDetails}/{productId}')
  Future<ProductDetailsModel> getProductDetails(
    @Path('productId') String productId,
  );

  // Get Order History API
  @GET(ApiConstants.apiOrderHistory)
  Future<List<OrderHistoryModel>> getOrdersHistory(
    @Query("AppUserId") String appUserId,
  );

  // Get Order History Details API
  @GET(ApiConstants.apiOrderHistoryDetails)
  Future<OrderHistoryDetailsModel> getOrdersHistoryDetails(
    @Query("id") String id,
    @Query("AppUserId") String appUserId,
  );

  // Get Delivery Method API
  @GET(ApiConstants.apiDeliveryMethod)
  Future<List<DeliveryMethodModel>> getDeliveryMethods();

  // New Order API
  @POST(ApiConstants.apiNewOrder)
  Future<NewOrderResponse> newOrder(
    @Body() NewOrderRequestBody newOrderRequestBody,
  );

  // Login API
  @POST(ApiConstants.apiLogin)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  // Signup API
  @POST(ApiConstants.apiSignup)
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);
}
