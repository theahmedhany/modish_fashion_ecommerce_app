import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/custom_main_app_bar.dart';
import '../../../../core/widgets/show_snack_bar.dart';
import '../widgets/custom_account_screen_item.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String? _appUserId;

  @override
  void initState() {
    super.initState();
    _loadAppUserId();
  }

  Future<void> _loadAppUserId() async {
    final id = await SharedPrefHelper.getString(SharedPrefKeys.appUserId);
    setState(() {
      _appUserId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          _appUserId == null
              ? const Center(child: CircularProgressIndicator())
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(14),
                  CustomMainAppBar(
                    scaffoldKey: widget.scaffoldKey,
                    title: 'Account',
                  ),
                  verticalSpace(24),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.r),
                            child: Text(
                              'Account Settings',
                              style: AppFonts.font18DarkMedium,
                            ),
                          ),
                          verticalSpace(16),
                          CustomAccountScreenItem(
                            text: 'Profile',
                            icon: 'assets/icons/profile.svg',
                            press:
                                () => context.pushNamed(Routes.profileScreen),
                          ),
                          _divider(),
                          CustomAccountScreenItem(
                            text: 'Category',
                            icon: 'assets/icons/category.svg',
                            press:
                                () => context.pushNamed(Routes.categoryScreen),
                          ),
                          _divider(),
                          CustomAccountScreenItem(
                            text: 'Orders History',
                            icon: 'assets/icons/cart.svg',
                            press: () {
                              context.pushNamed(
                                Routes.ordersHistoryScreen,
                                arguments: {'appUserId': _appUserId},
                              );
                            },
                          ),
                          _divider(),
                          CustomAccountScreenItem(
                            text: 'Support',
                            icon: 'assets/icons/support.svg',
                            press: _launchSupportEmail,
                          ),
                          _divider(),
                          CustomAccountScreenItem(
                            text: 'About Us',
                            icon: 'assets/icons/about_us.svg',
                            press:
                                () => Navigator.pushNamed(
                                  context,
                                  Routes.aboutUsScreen,
                                ),
                          ),
                          _divider(),
                          CustomAccountScreenItem(
                            text: 'Logout',
                            icon: 'assets/icons/logout.svg',
                            press: () async {
                              await SharedPrefHelper.clearAllSecuredData();
                              await SharedPrefHelper.clearAllData();
                              context.pushNamedAndRemoveUntil(
                                Routes.onboardingScreen,
                                predicate: (_) => false,
                              );
                            },
                          ),
                          _divider(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
    );
  }

  Widget _divider() => Divider(
    color: AppColors.kMainGrey.withValues(alpha: 0.5),
    endIndent: 20.r,
    indent: 20.r,
  );

  void _launchSupportEmail() {
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
      query: encodeQueryParameters({
        'subject': 'Hello Modish Team',
        'body': 'Hi, I have a question about...',
      }),
    );

    try {
      launchUrl(emailUrl);
    } catch (_) {
      showSnackBar(context, 'Could not launch this URL ($emailUrl).');
    }
  }
}
