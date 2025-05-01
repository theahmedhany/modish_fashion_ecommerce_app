import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class CategoryListCard extends StatelessWidget {
  const CategoryListCard({
    super.key,
    required this.press,
    required this.categoryTitle,
    required this.categoryImage,
  });

  final VoidCallback press;
  final String categoryTitle;
  final String categoryImage;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: press,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: AppColors.kPrimaryColor),
            ),
            child: Center(
              child: SvgPicture.asset(
                colorFilter: const ColorFilter.mode(
                  AppColors.kTextColor,
                  BlendMode.srcIn,
                ),
                categoryImage,
                width: 34.r,
                height: 34.r,
              ),
            ),
          ),

          verticalSpace(8),
          Text(
            categoryTitle,
            textAlign: TextAlign.center,
            style: AppFonts.font14GreyRegular,
          ),
        ],
      ),
    );
  }
}
