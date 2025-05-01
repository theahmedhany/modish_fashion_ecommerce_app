import 'package:flutter/material.dart';
import '../../data/models/product_details_model.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_fonts.dart';

class DetailsProductDescription extends StatelessWidget {
  const DetailsProductDescription({super.key, required this.details});

  final ProductDetailsModel details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description', style: AppFonts.font14DarkMedium),
        verticalSpace(8),
        Text(
          details.description ?? 'No description available',
          textAlign: TextAlign.justify,
          style: AppFonts.font12GreyRegular,
        ),
      ],
    );
  }
}
