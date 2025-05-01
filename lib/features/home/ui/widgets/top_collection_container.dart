import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_fonts.dart';

class TopCollectionContainer extends StatelessWidget {
  const TopCollectionContainer({
    super.key,
    required this.height,
    required this.circleRadius,
    required this.header,
    required this.content,
    required this.image,
    required this.paddingValue,
  });

  final int height;
  final double circleRadius;
  final double paddingValue;
  final String header, content, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: paddingValue.r),
      height: height.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffE2E2E2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                header,
                style: AppFonts.font14GreyRegular.copyWith(
                  color: const Color(0xFF777E90),
                ),
              ),
              verticalSpace(20),
              Text(content, style: AppFonts.font18DarkMedium),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: Container(
                    width: circleRadius.w,
                    height: circleRadius.h,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  child: Image.asset(image, fit: BoxFit.cover),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
