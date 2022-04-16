import 'package:flutter/material.dart';
import 'package:livetape/utils/styles.dart';

import 'main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final screens = [
    MainView(),
    Center(
      child: Text(
        'Scedule',
        style: TextStyle(color: Colors.black),
      ),
    ),
    Center(
      child: Text(
        'Account',
        style: TextStyle(color: Colors.black),
      ),
    ),
    Center(
      child: Text(
        'Settings',
        style: TextStyle(color: Colors.black),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF6F6F6),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              iconTheme: MaterialStateProperty.all(
                  IconThemeData(color: AppColors.primaryBlue)),
              indicatorColor: AppColors.primaryBlue.withOpacity(0.5),
              backgroundColor: AppColors.clearWhite.withOpacity(0.6),
              labelTextStyle:
                  MaterialStateProperty.all(TextStyle(color: Colors.black))),
          child: NavigationBar(
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            height: 80,
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.headset_mic_outlined), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.schedule), label: 'Scheduke'),
              NavigationDestination(
                  icon: Icon(Icons.account_circle_sharp), label: 'Account'),
              NavigationDestination(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        ),
        body: screens[index]);
  }
}
