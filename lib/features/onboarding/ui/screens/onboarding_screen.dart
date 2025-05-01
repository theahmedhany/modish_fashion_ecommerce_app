import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../widgets/onboarding_controls.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'buttonText': 'Next',
      'image': 'assets/images/onboarding_1.png',
      'title': 'Follow The Latest Fashion Style.',
      'description':
          'There Are Many Beautiful And Attractive Clothes Missed To Your Room.',
    },
    {
      'buttonText': 'Get Started',
      'image': 'assets/images/onboarding_2.png',
      'title': 'Start Journey With Modish.',
      'description': 'Smart, Gorgeous & Fashionable Collection.',
    },
  ];

  void _onNextPressed() {
    if (_currentIndex < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      context.pushNamed(Routes.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(data: onboardingData[index]);
                },
              ),
            ),
            OnboardingControls(
              currentIndex: _currentIndex,
              totalPages: onboardingData.length,
              buttonText: onboardingData[_currentIndex]['buttonText']!,
              onNextPressed: _onNextPressed,
            ),
            verticalSpace(30),
          ],
        ),
      ),
    );
  }
}
