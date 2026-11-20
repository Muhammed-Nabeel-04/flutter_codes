import 'package:flutter/material.dart';
import 'package:product_catalogue/provider/cart_provider.dart';
import 'package:product_catalogue/provider/filter_provider.dart';
import 'package:product_catalogue/provider/product_provider.dart';
import 'package:product_catalogue/provider/whishlist_provider.dart';

import 'package:product_catalogue/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WhishlistProvider()),
        ChangeNotifierProvider(create: (_) => FilterProvider()),


        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
