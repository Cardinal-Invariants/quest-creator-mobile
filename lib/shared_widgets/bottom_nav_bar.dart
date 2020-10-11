import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:quest_creator/screens/create_quest/create_quest.dart';
import 'package:quest_creator/screens/settings/settings.dart';
import 'package:quest_creator/screens/home_screen/home_screen.dart';
import 'package:quest_creator/screens/profile/profile.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  static int _selectedIndex = 0;

  static List<Widget> _widgetRoutes = <Widget>[
    HomeScreen(),
    CreateQuestScreen(),
    SettingsScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.amber[700], Colors.amberAccent]),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
          ]),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              duration: Duration(milliseconds: 600),
              tabBackgroundGradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.purple, Colors.deepPurple]),
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.create_outlined,
                  text: 'Create Quest',
                ),
                GButton(
                  icon: Icons.settings_outlined,
                  text: 'Settings',
                ),
                GButton(
                  icon: Icons.person_outline,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => _widgetRoutes[index]),
                );
              }),
        ),
      ),
    );
  }
}
