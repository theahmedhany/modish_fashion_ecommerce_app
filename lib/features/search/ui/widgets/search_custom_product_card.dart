import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import 'search_product_details.dart';
import 'search_product_image.dart';

class CustomSearchProductCard extends StatelessWidget {
  const CustomSearchProductCard({
    super.key,
    required this.imageSrc,
    required this.title,
    required this.price,
    required this.press,
  });

  final String imageSrc, title, price;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: press,
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.only(top: 16.r, left: 16.r, right: 16.r),
        decoration: ShapeDecoration(
          color: AppColors.kBackgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColors.kSecondaryGrey),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Column(
          children: [
            SearchProductImage(imageSrc: imageSrc),
            const SizedBox(height: 16),
            SearchProductDetails(title: title, price: price),
          ],
        ),
      ),
    );
  }
}
