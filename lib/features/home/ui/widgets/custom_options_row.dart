import 'package:flutter/material.dart';

import '../../../../core/theming/app_fonts.dart';

class CustomOptionsRow extends StatelessWidget {
  const CustomOptionsRow({
    super.key,
    required this.press,
    required this.optionTitle,
  });

  final VoidCallback press;
  final String optionTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(optionTitle, style: AppFonts.font18DarkMedium),
        InkWell(
          onTap: press,
          borderRadius: BorderRadius.circular(50),
          child: Text('Show all', style: AppFonts.font16GreyRegular),
        ),
      ],
    );
  }
}
