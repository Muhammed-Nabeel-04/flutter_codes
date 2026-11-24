import 'package:flutter/material.dart';
import 'package:product_catalogue/catalogue_screen.dart';
import 'package:product_catalogue/qoute_cart.dart';
import 'package:product_catalogue/wishlist.dart';

class Navigation extends StatefulWidget {
  const new({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentindex = 0;
  List pages = [CategoryScreen(), Wishlist(),QouteCart()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        onTap: (value) {
         setState(()  {currentindex = value;});
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Catalogue'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite, color: Colors.red), label: "Whishlist"),
          BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: "Qoute Cart"),
        ],
      ),
      body: pages[currentindex],
    );
  }
}
