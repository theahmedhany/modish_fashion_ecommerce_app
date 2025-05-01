import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_fonts.dart';
import '../../../../core/widgets/app_text_field.dart';

class ProfileTextFields extends StatelessWidget {
  const ProfileTextFields({super.key});

  Future<Map<String, String>> _loadUserData() async {
    final name = await SharedPrefHelper.getString(SharedPrefKeys.userName);
    final email = await SharedPrefHelper.getString(SharedPrefKeys.userEmail);
    return {'name': name, 'email': email};
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: FutureBuilder<Map<String, String>>(
        future: _loadUserData(),
        builder: (context, snapshot) {
          final name = snapshot.data?['name'] ?? 'Unknown Name';
          final email = snapshot.data?['email'] ?? 'Unknown Email';
          return Column(
            children: [
              _NameField(name: name),
              verticalSpace(30),
              _EmailField(email: email),
              verticalSpace(58),
            ],
          );
        },
      ),
    );
  }
}

class _NameField extends StatelessWidget {
  final String name;
  const _NameField({required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Full Name', style: AppFonts.font16DarkMedium),
        verticalSpace(12),
        AppTextField(hintText: name, enabled: false, validator: (value) {}),
      ],
    );
  }
}

class _EmailField extends StatelessWidget {
  final String email;
  const _EmailField({required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email Address', style: AppFonts.font16DarkMedium),
        verticalSpace(12),
        AppTextField(enabled: false, hintText: email, validator: (value) {}),
      ],
    );
  }
}
