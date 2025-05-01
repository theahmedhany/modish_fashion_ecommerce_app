import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_favorite_button.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../data/models/favorite_model.dart';

class FavoriteProductsList extends StatelessWidget {
  const FavoriteProductsList({super.key, required this.favoriteProducts});

  final List<FavoriteProductData> favoriteProducts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favoriteProducts.length,
      padding: EdgeInsets.zero,
      itemBuilder: (_, index) {
        final product = favoriteProducts[index];
        return Column(
          children: [
            CupertinoButton(
              onPressed: () {
                productDetailsId = product.productId ?? '';
                context.pushNamed(Routes.detailsScreen);
              },
              padding: EdgeInsets.zero,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.r),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.kSecondaryColor.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 0.5,
                          color: AppColors.kSecondaryGrey,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl: product.pictureUrl ?? '',
                          width: 100.r,
                          height: 100.r,
                          fit: BoxFit.cover,
                          placeholder: (context, url) {
                            return Center(child: CustomProgressIndicator());
                          },
                          errorWidget: (context, url, error) {
                            return Center(
                              child: Image.asset(
                                'assets/master/splash_screen.png',
                                width: 100.w,
                                fit: BoxFit.contain,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    horizontalSpace(20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name ?? 'Unknown Product',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppFonts.font18DarkMedium,
                          ),
                          verticalSpace(10),
                          Text(
                            '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppFonts.font16GreyRegular,
                          ),
                          verticalSpace(10),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.r),
                      width: 35.r,
                      height: 35.r,
                      child: CustomFavoriteButton(
                        itemId: product.productId ?? '',
                        name: product.name ?? '',
                        price: product.price ?? 0,
                        imageUrl: product.pictureUrl ?? '',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(color: AppColors.kMainGrey.withValues(alpha: 0.5)),
          ],
        );
      },
    );
  }
}
