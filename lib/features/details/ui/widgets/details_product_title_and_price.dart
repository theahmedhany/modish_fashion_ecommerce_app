import 'package:flutter/material.dart';

import '../../../../core/theming/app_fonts.dart';
import '../../data/models/product_details_model.dart';

class DetailsProductTitleAndPrice extends StatelessWidget {
  const DetailsProductTitleAndPrice({super.key, required this.details});

  final ProductDetailsModel details;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          details.name!.length > 20
              ? '${details.name!.substring(0, 20)}...'
              : details.name ?? 'Unknown Product',
          style: AppFonts.font20DarkSemiBold,
        ),
        Text(
          '\$${details.price.toString()}',
          style: AppFonts.font20DarkSemiBold,
        ),
      ],
    );
  }
}
