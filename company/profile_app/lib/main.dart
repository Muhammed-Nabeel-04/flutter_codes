import 'package:flutter/material.dart';
import 'package:profile_app/models_data.dart';
import 'package:profile_app/navigation_screen.dart';
import 'package:profile_app/profile_fill_screen.dart';
import 'package:profile_app/profile_show_screen.dart';
import 'package:profile_app/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode thememode = ThemeMode.light;

  void themeToggle(){
    setState(() {
          thememode = settings.isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: thememode,


      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white70,
          brightness: Brightness.light,
          primary: Colors.black,
          onPrimary: Colors.white,
          secondary: Colors.blueGrey,
          tertiary: Colors.grey,
          error: Colors.red,
          onError: Colors.green,
        ),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.dark,
          primary: Colors.white,
          onPrimary: Colors.black,
          secondary: const Color.fromARGB(221, 46, 45, 45),
          tertiary: Colors.black87,
          error: Colors.red,
          onError: Colors.green,
        ),
      ),

      // home: ProfileScreen(),
      // home: ProfileShowScreen(),
      // home: SettingsScreen(),
      home : NavigationScreen(toggle: themeToggle,)
    );
  }
}
