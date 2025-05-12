import 'package:flutter/widgets.dart';

import '../../../../core/theming/app_fonts.dart';
import '../../data/models/product_details_model.dart';

class CategoryDetailsName extends StatelessWidget {
  const CategoryDetailsName({super.key, required this.details});

  final ProductDetailsModel details;

  @override
  Widget build(BuildContext context) {
    return Text(
      details.categoryName ?? 'Unknown Category',
      style: AppFonts.font12GreyMedium,
    );
  }
}
