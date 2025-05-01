import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../account/ui/screens/account_screen.dart';
import '../../../favorite/ui/screens/favorite_screen.dart';
import '../../../search/ui/screens/search_screen.dart';
import '../widgets/custom_home_bottom_navigation_bar.dart';
import '../widgets/custom_home_drawer.dart';
import '../widgets/home_screen_content.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.kBackgroundColor,
      drawer: Drawer(
        backgroundColor: Colors.white,
        width: 280.w,
        child: CustomHomeDrawer(scaffoldKey: _scaffoldKey),
      ),
      body: PageView.builder(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        itemCount: 4,
        itemBuilder: (context, index) {
          if (index == 0) {
            return HomeScreenContent(scaffoldKey: _scaffoldKey);
          } else if (index == 1) {
            return SearchScreen(scaffoldKey: _scaffoldKey);
          } else if (index == 2) {
            return FavoriteScreen(scaffoldKey: _scaffoldKey);
          } else {
            return AccountScreen(scaffoldKey: _scaffoldKey);
          }
        },
      ),
      bottomNavigationBar: CustomHomeBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          _controller.jumpToPage(index);
        },
      ),
    );
  }
}
