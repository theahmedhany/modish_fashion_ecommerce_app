import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';
import '../theming/app_colors.dart';
import '../theming/app_fonts.dart';

class CustomAlertDialog extends StatelessWidget {
  final String dialogHeader;
  final String dialogBody;
  final Color dialogColor;
  final IconData dialogIcon;
  final VoidCallback press;

  const CustomAlertDialog({
    super.key,
    required this.dialogIcon,
    required this.dialogHeader,
    required this.dialogBody,
    required this.dialogColor,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.all(20.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: dialogColor.withValues(alpha: 0.4),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(12.r),
              child: Container(
                decoration: BoxDecoration(
                  color: dialogColor.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(10.r),
                child: Center(
                  child: Icon(dialogIcon, size: 30.r, color: Colors.white),
                ),
              ),
            ),
            verticalSpace(14),
            Text(
              dialogHeader,
              style: AppFonts.font18DarkBold.copyWith(
                color: AppColors.kTextColor,
              ),
            ),
            verticalSpace(14),
            Text(
              dialogBody,
              textAlign: TextAlign.center,
              style: AppFonts.font14DarkMedium.copyWith(
                color: AppColors.kMainGrey,
              ),
            ),
            verticalSpace(26),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: press,
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryColor,
                  padding: EdgeInsets.symmetric(vertical: 12.r),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'OK',
                  style: AppFonts.font14DarkMedium.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
