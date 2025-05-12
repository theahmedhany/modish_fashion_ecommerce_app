import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/category/data/repos/all_categories_repo.dart';
import '../../features/category/data/repos/category_repo.dart';
import '../../features/category/logic/all_categories/all_categories_cubit.dart';
import '../../features/category/logic/category/category_cubit.dart';
import '../../features/category/ui/screens/category_products_list.dart';
import '../../features/category/ui/screens/category_screen.dart';
import '../../features/details/data/repos/product_details_repo.dart';
import '../../features/details/logic/product_details_cubit.dart';
import '../../features/details/ui/screens/details_screen.dart';
import '../../features/home/ui/screens/home_screen.dart';
import '../../features/login/logic/login_cubit.dart';
import '../../features/login/ui/screens/login_screen.dart';
import '../../features/notifications/ui/screens/notifications_screen.dart';
import '../../features/onboarding/ui/screens/onboarding_screen.dart';
import '../../features/order/data/repos/delivery_method_repo.dart';
import '../../features/order/data/repos/order_history_details_repo.dart';
import '../../features/order/data/repos/order_history_repo.dart';
import '../../features/order/logic/delivery_method/delivery_method_cubit.dart';
import '../../features/order/logic/new_order/new_order_cubit.dart';
import '../../features/order/logic/order_history/order_history_cubit.dart';
import '../../features/order/logic/order_history_details/order_history_details_cubit.dart';
import '../../features/order/ui/screens/new_order_screen.dart';
import '../../features/order/ui/screens/orders_history_details_screen.dart';
import '../../features/order/ui/screens/orders_history_screen.dart';
import '../../features/products/data/repos/products_repo.dart';
import '../../features/products/logic/products_cubit.dart';
import '../../features/products/ui/screens/products_screen.dart';
import '../../features/profile/ui/screens/profile_screen.dart';
import '../../features/search/data/repos/search_products_repo.dart';
import '../../features/search/logic/search_products_cubit.dart';
import '../../features/signup/logic/signup_cubit.dart';
import '../../features/signup/ui/screens/signup_screen.dart';
import '../di/dependency_injection.dart';
import '../helpers/constants.dart';
import '../widgets/about_us_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Onboarding Screen
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      // Home Screen
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (context) =>
                            SearchProductsCubit(getIt<SearchProductsRepo>())
                              ..getProductsBySearch(
                                searchedProduct: filterProductsBySearch,
                              ),
                  ),
                ],
                child: HomeScreen(),
              ),
        );

      // Login Screen
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: LoginScreen(),
              ),
        );

      // Login Screen
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<SignupCubit>(),
                child: SignupScreen(),
              ),
        );

      // Notifications Screen
      case Routes.notificationsScreen:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());

      // Profile Screen
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      // Category Screen
      case Routes.categoryScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        AllCategoriesCubit(getIt<AllCategoriesRepo>())
                          ..emitGetAllCategories(),
                child: CategoryScreen(),
              ),
        );

      // Products Screen
      case Routes.productsScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        ProductsCubit(getIt<ProductsRepo>())
                          ..emitGetAllProducts(),
                child: ProductsScreen(),
              ),
        );

      // Category Products List Screen
      case Routes.categoryProductsList:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) => CategoryCubit(getIt<CategoryRepo>())
                      ..emitGetAllProductsByCategory(
                        isInitialLoad: true,
                        categoryId: masterCategoryId,
                      ),
                child: CategoryProductsList(
                  categoryId: masterCategoryId,
                  categoryName: masterCategoryName,
                ),
              ),
        );

      // Details Screen
      case Routes.detailsScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        ProductDetailsCubit(getIt<ProductDetailsRepo>())
                          ..emitGetProductDetails(productDetailsId),

                child: DetailsScreen(productId: productDetailsId),
              ),
        );

      // About Us Screen
      case Routes.aboutUsScreen:
        return MaterialPageRoute(builder: (_) => AboutUsScreen());

      // New Order Screen
      case Routes.newOrderScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => getIt<NewOrderCubit>()),
                  BlocProvider(
                    create:
                        (context) =>
                            DeliveryMethodCubit(getIt<DeliveryMethodRepo>())
                              ..emitGetDeliveryMethods(),
                  ),
                ],
                child: NewOrderScreen(
                  productName: args?['productName'],
                  productImage: args?['productImage'],
                  productPrice: args?['productPrice'],
                  productId: args?['productId'],
                ),
              ),
        );

      // Order History Screen
      case Routes.ordersHistoryScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        OrderHistoryCubit(getIt<OrderHistoryRepo>())
                          ..emitGetOrderHistory(),
                child: OrdersHistoryScreen(),
              ),
        );

      // Order History Details Screen
      case Routes.ordersHistoryDetailsScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) => OrderHistoryDetailsCubit(
                      getIt<OrderHistoryDetailsRepo>(),
                    )..emitGetOrderHistoryDetails(args['productId']),
                child: OrdersHistoryDetailsScreen(),
              ),
        );

      default:
        return null;
    }
  }
}
