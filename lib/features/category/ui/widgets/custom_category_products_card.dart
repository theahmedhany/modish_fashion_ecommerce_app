import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import 'category_products_details.dart';
import 'category_products_image.dart';

class CustomCategoryProductsCard extends StatelessWidget {
  const CustomCategoryProductsCard({
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
            CategoryProductsImage(imageSrc: imageSrc),
            const SizedBox(height: 16),
            CategoryProductsDetails(title: title, price: price),
          ],
        ),
      ),
    );
  }
}
