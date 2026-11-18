import 'package:flutter/material.dart';

import 'package:product_catalogue/router.dart';

void main() {
  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      // home: CategoryScreen(),
    );
  }
}
