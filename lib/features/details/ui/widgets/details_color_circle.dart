import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';

class DetailsColorCircle extends StatelessWidget {
  final Color circleColor;
  final bool selected;

  const DetailsColorCircle({
    super.key,
    required this.circleColor,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34.w,
      height: 34.h,
      decoration: BoxDecoration(color: circleColor, shape: BoxShape.circle),
      child:
          selected
              ? Icon(Icons.check, color: AppColors.kBackgroundColor, size: 20.r)
              : const SizedBox.shrink(),
    );
  }
}
