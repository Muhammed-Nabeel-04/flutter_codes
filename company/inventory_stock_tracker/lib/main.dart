import 'package:flutter/material.dart';
import 'package:inventory_stock_tracker/inventory_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
     themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,



      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white70,
          brightness: Brightness.light,
          primary: Colors.black,
          secondary: Colors.blueGrey,
          tertiary: Colors.grey,
          error: Colors.red,
          onError: Colors.green
        ),
      ),



      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.dark,
          primary: Colors.white,
          secondary: const Color.fromARGB(221, 46, 45, 45),
          tertiary: Colors.black87,
          error: Colors.red,
          onError: Colors.green

        ),
      ),




      home: Inventoryscreen(
        isDarkMode: themeMode == ThemeMode.dark,
        onThemeToggle: toggleTheme,
      ),
    );
  }
}
