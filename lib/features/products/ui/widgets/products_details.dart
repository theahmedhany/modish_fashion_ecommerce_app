import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_fonts.dart';

class ProductsDetails extends StatelessWidget {
  final String title;
  final String price;

  const ProductsDetails({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            maxLines: 2,
            style: AppFonts.font14DarkMedium.copyWith(
              overflow: TextOverflow.ellipsis,
              height: 1.5,
            ),
          ),
          verticalSpace(8),
          Text(
            price,
            maxLines: 1,
            style: AppFonts.font12GreyMedium.copyWith(
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
