import 'package:flutter/material.dart';
import 'package:profile_app/models_data.dart';
import 'package:profile_app/navigation_screen.dart';

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
          onPrimary: const Color.fromARGB(255, 197, 197, 197),
          secondary: Colors.blueGrey,
          tertiary: Colors.grey,
          error: Colors.red,
          onError: Colors.green,
        ),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black87,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.dark,
          primary: Colors.white,
          onPrimary:  const Color.fromARGB(255, 22, 21, 21),
          secondary: const Color.fromARGB(221, 48, 40, 40),
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
