import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/category/data/repos/all_categories_repo.dart';
import '../../features/category/data/repos/category_repo.dart';
import '../../features/category/logic/all_categories/all_categories_cubit.dart';
import '../../features/category/logic/category/category_cubit.dart';
import '../../features/details/data/repos/product_details_repo.dart';
import '../../features/details/logic/product_details_cubit.dart';
import '../../features/login/data/repos/login_repo.dart';
import '../../features/login/logic/login_cubit.dart';
import '../../features/order/data/repos/delivery_method_repo.dart';
import '../../features/order/data/repos/new_order_repo.dart';
import '../../features/order/data/repos/order_history_details_repo.dart';
import '../../features/order/data/repos/order_history_repo.dart';
import '../../features/order/logic/delivery_method/delivery_method_cubit.dart';
import '../../features/order/logic/new_order/new_order_cubit.dart';
import '../../features/order/logic/order_history/order_history_cubit.dart';
import '../../features/order/logic/order_history_details/order_history_details_cubit.dart';
import '../../features/products/data/repos/products_repo.dart';
import '../../features/products/logic/products_cubit.dart';
import '../../features/search/data/repos/search_products_repo.dart';
import '../../features/search/logic/search_products_cubit.dart';
import '../../features/signup/data/repos/signup_repo.dart';
import '../../features/signup/logic/signup_cubit.dart';
import '../networking/api_services.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  // All Products
  getIt.registerLazySingleton<ProductsRepo>(
    () => ProductsRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<ProductsCubit>(
    () => ProductsCubit(getIt<ProductsRepo>()),
  );

  // Products By Category
  getIt.registerLazySingleton<CategoryRepo>(
    () => CategoryRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<CategoryCubit>(
    () => CategoryCubit(getIt<CategoryRepo>()),
  );

  // All Categories
  getIt.registerLazySingleton<AllCategoriesRepo>(
    () => AllCategoriesRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<AllCategoriesCubit>(
    () => AllCategoriesCubit(getIt<AllCategoriesRepo>()),
  );

  // Search Products
  getIt.registerLazySingleton<SearchProductsRepo>(
    () => SearchProductsRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<SearchProductsCubit>(
    () => SearchProductsCubit(getIt<SearchProductsRepo>()),
  );

  // Product Details
  getIt.registerLazySingleton<ProductDetailsRepo>(
    () => ProductDetailsRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<ProductDetailsCubit>(
    () => ProductDetailsCubit(getIt<ProductDetailsRepo>()),
  );

  // Order History
  getIt.registerLazySingleton<OrderHistoryRepo>(
    () => OrderHistoryRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<OrderHistoryCubit>(
    () => OrderHistoryCubit(getIt<OrderHistoryRepo>()),
  );

  // Order History Details
  getIt.registerLazySingleton<OrderHistoryDetailsRepo>(
    () => OrderHistoryDetailsRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<OrderHistoryDetailsCubit>(
    () => OrderHistoryDetailsCubit(getIt<OrderHistoryDetailsRepo>()),
  );

  // Order History Details
  getIt.registerLazySingleton<DeliveryMethodRepo>(
    () => DeliveryMethodRepo(getIt<ApiServices>()),
  );
  getIt.registerFactory<DeliveryMethodCubit>(
    () => DeliveryMethodCubit(getIt<DeliveryMethodRepo>()),
  );

  // Login
  getIt.registerLazySingleton<NewOrderRepo>(() => NewOrderRepo(getIt()));
  getIt.registerFactory<NewOrderCubit>(() => NewOrderCubit(getIt()));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // Signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}
