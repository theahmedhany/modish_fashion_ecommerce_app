import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import 'products_details.dart';
import 'products_image.dart';

class CustomProductsCard extends StatelessWidget {
  const CustomProductsCard({
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
            ProductsImage(imageSrc: imageSrc),
            const SizedBox(height: 16),
            ProductsDetails(title: title, price: price),
          ],
        ),
      ),
    );
  }
}
