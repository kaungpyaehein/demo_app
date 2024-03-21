import 'package:flutter/material.dart';
import 'package:iapp_flutter_interview_app/pages/user_details_list_page.dart';
import 'package:iapp_flutter_interview_app/pages/user_list_page.dart';
import 'package:iapp_flutter_interview_app/utils/colors.dart';
import 'package:iconsax/iconsax.dart';

import 'home_page.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int selectedIndex = 0;

  final List<Widget> _pagesToDisplay = [
    const HomePage(),
    const UserDetailsPage(),
    const UserListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        elevation: 2,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: kBottomNavigationBarColor,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        enableFeedback: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Iconsax.home_25,
              ),
              activeIcon: Icon(
                Iconsax.home_25,
              ),
              label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.grid_view_rounded,
              size: 27,
            ),
            activeIcon: Icon(
              Icons.grid_view_rounded,
              size: 27,
            ),
            label: "Cards",
          ),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.shopping_bag5),
              activeIcon: Icon(Iconsax.shopping_bag5),
              label: "Names"),
        ],
      ),
      body: _pagesToDisplay[selectedIndex],
    );
  }
}
