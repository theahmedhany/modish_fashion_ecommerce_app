import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';

class OnboardingPage extends StatelessWidget {
  final Map<String, String> data;
  const OnboardingPage({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(data['image']!),
          verticalSpace(42),
          Text(
            data['title']!,
            style: TextStyle(
              color: AppColors.kTextColor,
              fontSize: 36.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          verticalSpace(8),
          Text(
            data['description']!,
            style: TextStyle(
              color: AppColors.kMainGrey,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
