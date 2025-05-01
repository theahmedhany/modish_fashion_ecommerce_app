import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../../category/data/models/category_model/category_model.dart';

class RecommendedProductsListItem extends StatelessWidget {
  const RecommendedProductsListItem({
    super.key,
    required this.index,
    required this.product,
  });

  final int index;
  final CategoryData product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        productDetailsId = product.productId!;
        context.pushNamed(Routes.detailsScreen);
      },
      child: Container(
        margin: EdgeInsets.only(right: 16.w, left: index == 0 ? 20.w : 0),
        padding: EdgeInsets.only(right: 14.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        width: 230.w,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.kSecondaryColor.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 0.5, color: AppColors.kSecondaryGrey),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: product.pictureUrl!,
                  height: 80.r,
                  width: 80.r,
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
            horizontalSpace(14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (product.name ?? 'No Title').length > 12
                      ? '${product.name!.substring(0, 12)}...'
                      : product.name ?? 'No Title',
                  style: AppFonts.font14GreyRegular.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '\$${(product.price ?? 0).toStringAsFixed(2)}',
                  style: AppFonts.font16DarkBold.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
