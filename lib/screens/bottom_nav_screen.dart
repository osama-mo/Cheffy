import 'package:cheffy/screens/SearchScreen/search_screen.dart';
import 'package:cheffy/screens/SettingsScreen/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CategoryScreen/category_screen.dart';
import 'HomeScreen/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    super.initState();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    buildCurrentPage(int i) {
      switch (i) {
        case 0:
          return const HomeScreen();
        case 1:
          return SearchScreen();
        case 2:
          return const CategoryScreen();
        case 3:
          return const SettingsScreen();
        default:
          return Container();
      }
    }

    return Scaffold(
      body: buildCurrentPage(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 44, 44, 44),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        iconSize: 26.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            backgroundColor: Color.fromARGB(255, 44, 44, 44),
            activeIcon: Icon(
              CupertinoIcons.house_fill,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            backgroundColor: Color.fromARGB(255, 44, 44, 44),
            activeIcon: Icon(
              CupertinoIcons.search,
              color: Colors.white,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category_outlined,
              color: Colors.white,
            ),
            backgroundColor: Color.fromARGB(255, 44, 44, 44),
            label: 'Categories',
            activeIcon: Icon(
              Icons.category,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_applications_rounded,
              color: Colors.white,
            ),
            backgroundColor: Color.fromARGB(255, 44, 44, 44),
            label: 'Settings',
            activeIcon: Icon(
              Icons.settings_applications_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
