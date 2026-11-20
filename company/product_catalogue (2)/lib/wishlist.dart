import 'package:flutter/material.dart';
import 'package:product_catalogue/provider/whishlist_provider.dart';
import 'package:product_catalogue/widgets/model.dart/product_model.dart';
import 'package:product_catalogue/widgets/list_tile_widget.dart';
import 'package:provider/provider.dart';

class Wishlist extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    // final p = products.where((p) => p.wished == true).toList();
    final p = context.watch<WhishlistProvider>().items;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wishlist',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: p.isEmpty
          ? Center(
              child: Text(
                "No Products Available",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            )
          : Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: ListView.builder(
          
          itemCount: p.length,
          itemBuilder: (context, i) {
            final items = p[i];
            return ListTileWidget(item: items, favorite: true,);
          },
        ),
      ),
    );
  }
}
