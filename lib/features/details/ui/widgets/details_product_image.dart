import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../data/models/product_details_model.dart';
import 'details_header_icons.dart';

class DetailsProductImage extends StatelessWidget {
  const DetailsProductImage({super.key, required this.details});

  final ProductDetailsModel details;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kSecondaryColor.withAlpha(76),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
        border: Border.all(width: 0.5, color: AppColors.kSecondaryGrey),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: details.pictureUrl ?? '',
              width: double.infinity,
              height: 500.r,
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
            Align(
              alignment: Alignment.topCenter,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.r,
                    vertical: 8.r,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DetailsHeaderIcons(
                        icon: Icons.arrow_back_ios_rounded,
                        onTap: () => Navigator.pop(context),
                      ),
                      const DetailsHeaderIcons(icon: Icons.more_vert_rounded),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
