import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/show_snack_bar.dart';
import 'custom_home_drawer_item.dart';

class CustomHomeDrawer extends StatelessWidget {
  const CustomHomeDrawer({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  Future<Map<String, String>> _loadUserData() async {
    final name = await SharedPrefHelper.getString(SharedPrefKeys.userName);
    final email = await SharedPrefHelper.getString(SharedPrefKeys.userEmail);
    final appUserId = await SharedPrefHelper.getString(
      SharedPrefKeys.appUserId,
    );
    return {'name': name, 'email': email, 'appUserId': appUserId};
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<Map<String, String>>(
        future: _loadUserData(),
        builder: (context, snapshot) {
          final name = snapshot.data?['name'] ?? 'Unknown Name';
          final email = snapshot.data?['email'] ?? 'Unknown Email';
          final appUserId = snapshot.data?['appUserId'] ?? 'Unknown';
          return ListView(
            children: [
              verticalSpace(50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 52.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/user_profile.png'),
                        ),
                      ),
                    ),
                    horizontalSpace(12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: AppFonts.font16DarkBold),
                        Text(email, style: AppFonts.font12DarkRegular),
                      ],
                    ),
                  ],
                ),
              ),
              verticalSpace(60),
              CustomHomeDrawerItem(
                text: 'Profile',
                icon: 'assets/icons/profile.svg',
                press: () {
                  context.pushNamed(Routes.profileScreen);
                  scaffoldKey.currentState?.closeDrawer();
                },
              ),
              verticalSpace(16),
              CustomHomeDrawerItem(
                text: 'Category',
                icon: 'assets/icons/category.svg',
                press: () {
                  context.pushNamed(Routes.categoryScreen);
                  scaffoldKey.currentState?.closeDrawer();
                },
              ),
              verticalSpace(16),
              CustomHomeDrawerItem(
                text: 'Orders History',
                icon: 'assets/icons/cart.svg',
                press: () {
                  context.pushNamed(
                    Routes.ordersHistoryScreen,
                    arguments: {'appUserId': appUserId},
                  );
                  scaffoldKey.currentState?.closeDrawer();
                },
              ),
              verticalSpace(16),
              CustomHomeDrawerItem(
                text: 'Support',
                icon: 'assets/icons/support.svg',
                press: () {
                  String? encodeQueryParameters(Map<String, String> params) {
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
                  scaffoldKey.currentState?.closeDrawer();
                },
              ),
              verticalSpace(16),
              CustomHomeDrawerItem(
                text: 'About Us',
                icon: 'assets/icons/about_us.svg',
                press: () {
                  Navigator.pushNamed(context, Routes.aboutUsScreen);
                  scaffoldKey.currentState?.closeDrawer();
                },
              ),
              verticalSpace(16),
              CustomHomeDrawerItem(
                text: 'Logout',
                icon: 'assets/icons/logout.svg',
                press: () async {
                  await SharedPrefHelper.clearAllSecuredData();
                  await SharedPrefHelper.clearAllData();
                  context.pushNamedAndRemoveUntil(
                    Routes.onboardingScreen,
                    predicate: (route) => false,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
