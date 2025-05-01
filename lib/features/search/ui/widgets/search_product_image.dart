import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';

import '../../../../core/theming/app_colors.dart';

class SearchProductImage extends StatelessWidget {
  final String imageSrc;

  const SearchProductImage({super.key, required this.imageSrc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kSecondaryColor.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 0.5, color: AppColors.kSecondaryGrey),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl: imageSrc,
          width: double.infinity,
          height: 120.r,
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
    );
  }
}
