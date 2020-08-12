import 'package:animatedbottomnavbar/screens/accounts_screen.dart';
import 'package:animatedbottomnavbar/screens/home.dart';
import 'package:animatedbottomnavbar/screens/payments_screen.dart';
import 'package:animatedbottomnavbar/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:animatedbottomnavbar/animated_bottomnavbar.dart';

class HomeScreen extends StatefulWidget {
  //variable for checking whitch Bar is selected
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedBarIndex = 0;
  static List<Widget> screenList = <Widget>[
    Home(),
    AccountsScreen(),
    PaymentsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screenList.elementAt(selectedBarIndex),
        bottomNavigationBar: AnimatedBottomNavBar(
          navItems: navItems,
          animationDuration: const Duration(milliseconds: 220),
          onBarTap: (index) {
            setState(() {
              selectedBarIndex = index;
            });
          },
        ),
      ),
    );
  }
}
