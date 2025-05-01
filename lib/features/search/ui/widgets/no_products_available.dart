import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_fonts.dart';

class NoProductsAvailable extends StatelessWidget {
  const NoProductsAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('No products found', style: AppFonts.font16DarkMedium),
          verticalSpace(8),
          Text(
            'Try searching for something else',
            style: AppFonts.font14GreyRegular,
          ),
        ],
      ),
    );
  }
}
