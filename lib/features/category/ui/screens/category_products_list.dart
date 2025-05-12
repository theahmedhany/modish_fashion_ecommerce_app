import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../data/models/category_model/category_model.dart';
import '../../logic/category/category_cubit.dart';
import '../../logic/category/category_state.dart';
import '../widgets/custom_category_products_card.dart';

class CategoryProductsList extends StatefulWidget {
  const CategoryProductsList({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  final String categoryId;
  final String categoryName;

  @override
  State<CategoryProductsList> createState() => _CategoryProductsListState();
}

class _CategoryProductsListState extends State<CategoryProductsList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    context.read<CategoryCubit>().emitGetAllProductsByCategory(
      isInitialLoad: true,
      categoryId: widget.categoryId,
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<CategoryCubit>().emitGetAllProductsByCategory(
        isInitialLoad: false,
        categoryId: widget.categoryId,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: CustomAppBar(title: widget.categoryName),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: BlocConsumer<CategoryCubit, CategoryState<CategoryModel>>(
          listener: (context, state) {
            // TODO : Handle state changes.
          },
          builder: (context, state) {
            final cubit = context.read<CategoryCubit>();

            return state.when(
              idle: () => const Center(child: CustomProgressIndicator()),
              loading: () => const Center(child: CustomProgressIndicator()),
              success: (products) {
                if (products.data == null || products.data!.isEmpty) {
                  return Center(
                    child: Text(
                      'No products found for this category.',
                      style: AppFonts.font14DarkMedium,
                    ),
                  );
                }

                return RefreshIndicator(
                  color: AppColors.kPrimaryColor,
                  onRefresh: () async {
                    cubit.emitGetAllProductsByCategory(
                      isInitialLoad: true,
                      categoryId: widget.categoryId,
                    );
                  },
                  child: GridView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.only(bottom: 26.r, top: 12.r),
                    physics: const AlwaysScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      mainAxisExtent: MediaQuery.of(context).size.height * 0.28,
                    ),
                    itemCount:
                        (products.data?.length ?? 0) +
                        (cubit.hasReachedMax ? 0 : 1),
                    itemBuilder: (_, index) {
                      if (index >= (products.data?.length ?? 0)) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomProgressIndicator(),
                          ),
                        );
                      }

                      final product = products.data?[index];
                      String imageUrl = product?.pictureUrl ?? '';
                      imageUrl = imageUrl.replaceFirst('https://', 'http://');

                      return CustomCategoryProductsCard(
                        imageSrc: imageUrl,
                        title: product?.name ?? '',
                        price: '\$${(product?.price ?? 0).toStringAsFixed(2)}',
                        press: () {
                          productDetailsId = product!.productId!;
                          context.pushNamed(Routes.detailsScreen);
                        },
                      );
                    },
                  ),
                );
              },
              error: (errorMsg) {
                return Center(
                  child: Text(
                    errorMsg.toString(),
                    style: TextStyle(
                      color: AppColors.kTextColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
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
