import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../../category/data/repos/category_repo.dart';
import '../../../category/logic/category/category_cubit.dart';
import '../../../category/logic/category/category_state.dart';
import 'feature_products_list_item.dart';

class FeatureProductsListView extends StatelessWidget {
  const FeatureProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => CategoryCubit(getIt<CategoryRepo>())
            ..emitGetAllProductsByCategory(
              categoryId: 'a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d',
            ),
      child: SizedBox(
        height: 230.h,
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
                      'No featured products found',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: products.data?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final product = products.data?[index];
                    if (product == null) return const SizedBox();

                    return FeatureProductsListItem(
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
