import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../../category/data/models/category_model/category_model.dart';

class FeatureProductsListItem extends StatelessWidget {
  const FeatureProductsListItem({
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
        margin: EdgeInsets.only(right: 16, left: index == 0 ? 20 : 0),
        width: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  height: 170.h,
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
            const SizedBox(height: 8),
            Text(
              product.name ?? 'No Title',
              style: AppFonts.font14GreyRegular.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),
            Text(
              '\$${(product.price ?? 0).toStringAsFixed(2)}',
              style: AppFonts.font16DarkBold.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
