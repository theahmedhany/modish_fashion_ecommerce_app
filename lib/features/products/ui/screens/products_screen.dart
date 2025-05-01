import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../data/models/products_model.dart';
import '../../logic/products_cubit.dart';
import '../../logic/products_state.dart';
import '../widgets/custom_products_card.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    context.read<ProductsCubit>().emitGetAllProducts(isInitialLoad: true);
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
      context.read<ProductsCubit>().emitGetAllProducts(isInitialLoad: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: const CustomAppBar(title: 'Products'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: BlocConsumer<ProductsCubit, ProductsState<ProductsModel>>(
          listener: (context, state) {
            // TODO : Handle state changes.
          },
          builder: (context, state) {
            final cubit = context.read<ProductsCubit>();

            return state.when(
              idle: () => const Center(child: CustomProgressIndicator()),
              loading: () => const Center(child: CustomProgressIndicator()),
              success: (products) {
                return RefreshIndicator(
                  color: AppColors.kPrimaryColor,
                  onRefresh: () async {
                    cubit.emitGetAllProducts(isInitialLoad: true);
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

                      return CustomProductsCard(
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
