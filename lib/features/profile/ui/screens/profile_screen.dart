import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/profile_text_fields.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<Map<String, String>> _loadUserData() async {
    final name = await SharedPrefHelper.getString(SharedPrefKeys.userName);
    final email = await SharedPrefHelper.getString(SharedPrefKeys.userEmail);
    return {'name': name, 'email': email};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: const CustomAppBar(title: 'Profile'),
      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder<Map<String, String>>(
            future: _loadUserData(),
            builder: (context, snapshot) {
              final name = snapshot.data?['name'] ?? 'Unknown Name';
              return Column(
                children: [
                  verticalSpace(30),
                  Container(
                    width: 140.r,
                    height: 140.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.kPrimaryColor,
                        width: 10,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 70,
                      backgroundColor: AppColors.kPrimaryColor,
                      backgroundImage: AssetImage(
                        'assets/images/user_profile.png',
                      ),
                    ),
                  ),
                  verticalSpace(20),
                  Text(
                    name.split(' ')[0],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF574964),
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      height: 1.40,
                    ),
                  ),
                  verticalSpace(50),
                  const ProfileTextFields(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
