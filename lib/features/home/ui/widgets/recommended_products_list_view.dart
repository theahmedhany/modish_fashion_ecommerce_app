import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../../category/data/repos/category_repo.dart';
import '../../../category/logic/category/category_cubit.dart';
import '../../../category/logic/category/category_state.dart';
import 'recommended_products_list_item.dart';

class RecommendedProductsListView extends StatelessWidget {
  const RecommendedProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => CategoryCubit(getIt<CategoryRepo>())
            ..emitGetAllProductsByCategory(
              categoryId: 'd4e5f6a7-b8c9-4d0e-1f2a-3b4c5d6e7f8g',
            ),
      child: SizedBox(
        height: 80.h,
        child: BlocConsumer<CategoryCubit, CategoryState>(
          listener: (context, state) {
            // TODO : Handle state changes.
          },
          builder: (context, state) {
            return state.when(
              idle: () => const Center(child: CustomProgressIndicator()),
              loading: () => const Center(child: CustomProgressIndicator()),
              success: (products) {
                if (products.data == null || products.data!.isEmpty) {
                  return Center(
                    child: Text(
                      'No recommended products found',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  );
                }

                final reversedProducts = products.data?.reversed.toList() ?? [];

                return ListView.builder(
                  itemCount: reversedProducts.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final product = reversedProducts[index];
                    return RecommendedProductsListItem(
                      index: index,
                      product: product,
                    );
                  },
                );
              },
              error: (error) {
                return Center(
                  child: Text(
                    error.toString(),
                    style: TextStyle(fontSize: 14.sp),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
