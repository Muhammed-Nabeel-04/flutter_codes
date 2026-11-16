import 'package:flutter/material.dart';
import 'package:profile_app/profile_show_screen.dart';

import 'settings_screen.dart';

class NavigationScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex =0 ;
  List pages = [ProfileShowScreen() , SettingsScreen()];


 void reload() {
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),

      ]),
      body: pages[currentIndex],
    );
  }
}