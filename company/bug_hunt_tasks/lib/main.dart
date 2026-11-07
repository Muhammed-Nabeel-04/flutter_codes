import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const BugHuntApp());
}

class BugHuntApp extends StatelessWidget {
  const BugHuntApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bug Hunt Tasks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}
