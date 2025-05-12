import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/main_loading_indicator.dart';
import '../../logic/product_details_cubit.dart';
import '../../logic/product_details_state.dart';
import '../widgets/category_details_name.dart';
import '../widgets/details_buy_section.dart';
import '../widgets/details_product_color_options.dart';
import '../widgets/details_product_description.dart';
import '../widgets/details_product_image.dart';
import '../widgets/details_product_title_and_price.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          return state.when(
            idle: () => const Center(child: MainLoadingIndicator()),
            loading: () => const Center(child: MainLoadingIndicator()),
            success:
                (productDetails) => SingleChildScrollView(
                  child: Column(
                    children: [
                      DetailsProductImage(details: productDetails),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpace(20),
                            DetailsProductTitleAndPrice(
                              details: productDetails,
                            ),
                            CategoryDetailsName(details: productDetails),
                            verticalSpace(24),
                            DetailsProductColorOptions(details: productDetails),
                            verticalSpace(24),
                            DetailsProductDescription(details: productDetails),
                            verticalSpace(50),
                            DetailsBuySection(details: productDetails),
                            verticalSpace(30),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
    );
  }
}
