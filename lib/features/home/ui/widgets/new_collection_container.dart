import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_fonts.dart';

class NewCollectionContainer extends StatelessWidget {
  const NewCollectionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('NEW COLLECTION', style: AppFonts.font14GreyRegular),
                verticalSpace(20),
                Text('HANG OUT \n& PARTY', style: AppFonts.font20DarkMedium),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Center(
                    child: Container(
                      width: 132,
                      height: 132,
                      decoration: ShapeDecoration(
                        color: Color(0xFFE2E2E2).withValues(alpha: 0.5),
                        shape: OvalBorder(),
                      ),
                      child: Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: ShapeDecoration(
                            color: Color(0xffE2E2E2),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/model_3.png',
                      height: 150.h,
                      width: 100.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
