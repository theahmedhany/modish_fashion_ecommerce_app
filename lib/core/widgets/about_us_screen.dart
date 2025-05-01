import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helpers/spacing.dart';
import '../theming/app_colors.dart';
import '../theming/app_fonts.dart';
import 'custom_app_bar.dart';
import 'show_snack_bar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: const CustomAppBar(title: 'About Us'),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.r,
                    vertical: 10.r,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(10),
                      Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          width: 100.w,
                          height: 100.h,
                          'assets/icons/about_us.svg',
                          colorFilter: ColorFilter.mode(
                            AppColors.kPrimaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      verticalSpace(16),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'About Modish',
                          style: AppFonts.font20DarkSemiBold,
                        ),
                      ),
                      verticalSpace(32),
                      Text(
                        'Welcome to Modish!',
                        style: AppFonts.font18DarkRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        'At Modish, fashion meets simplicity. We’re a modern clothing e-commerce platform built to help you find trendy, affordable, and high-quality outfits from the comfort of your home. Whether you’re shopping for casual wear, work attire, or something for a special occasion — Modish has you covered.',
                        style: AppFonts.font14GreyRegular,
                      ),
                      verticalSpace(24),
                      Text('Our Mission', style: AppFonts.font18DarkRegular),
                      verticalSpace(12),
                      Text(
                        'We believe fashion should be accessible and enjoyable for everyone. Our mission is to bring you a seamless online shopping experience with curated collections that fit your style and budget.',
                        style: AppFonts.font14GreyRegular,
                      ),
                      verticalSpace(24),
                      Text(
                        'Why Shop With Us?',
                        style: AppFonts.font18DarkRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• Trend-Driven Collections: Updated frequently with the latest styles.',
                        style: AppFonts.font14GreyRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• Quality First: We partner with top-tier manufacturers to ensure every piece meets our standards.',
                        style: AppFonts.font14GreyRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• Fast Delivery: Swift and reliable shipping across major regions.',
                        style: AppFonts.font14GreyRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        '• Easy Returns: Hassle-free returns if something isn’t quite right.',
                        style: AppFonts.font14GreyRegular,
                      ),
                      verticalSpace(24),
                      Text(
                        'Connect With Us',
                        style: AppFonts.font18DarkRegular,
                      ),
                      verticalSpace(12),
                      Text(
                        'Have questions, feedback, or just want to say hi? We’d love to hear from you!',
                        style: AppFonts.font14GreyRegular,
                      ),
                      verticalSpace(8),
                      InkWell(
                        onTap: () {
                          String? encodeQueryParameters(
                            Map<String, String> params,
                          ) {
                            return params.entries
                                .map(
                                  (e) =>
                                      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
                                )
                                .join('&');
                          }

                          final Uri emailUrl = Uri(
                            scheme: 'mailto',
                            path: 'support@modishwear.com',
                            query: encodeQueryParameters(<String, String>{
                              'subject': 'Hello Modish Team',
                              'body': 'Hi, I have a question about...',
                            }),
                          );

                          try {
                            launchUrl(emailUrl);
                          } catch (e) {
                            showSnackBar(
                              context,
                              'Could not launch this URL ($emailUrl).',
                            );
                          }
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Text(
                          'Email: support@modishwear.com',
                          style: AppFonts.font14DarkMedium.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      verticalSpace(32),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
