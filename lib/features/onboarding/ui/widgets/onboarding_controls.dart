import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';

class OnboardingControls extends StatelessWidget {
  final int currentIndex;
  final int totalPages;
  final String buttonText;
  final VoidCallback onNextPressed;

  const OnboardingControls({
    required this.currentIndex,
    required this.totalPages,
    required this.buttonText,
    required this.onNextPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: List.generate(
              totalPages,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4.r),
                height: 5.h,
                width: currentIndex == index ? 50.w : 10.w,
                decoration: BoxDecoration(
                  color:
                      currentIndex == index
                          ? AppColors.kPrimaryColor
                          : AppColors.kMainGrey,
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
            ),
          ),
          CupertinoButton(
            onPressed: onNextPressed,
            padding: EdgeInsets.zero,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 16.w),
              decoration: ShapeDecoration(
                color: AppColors.kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
