import 'package:flutter/material.dart';
import 'package:product_catalogue/product_model.dart';

class ProductListScreen extends StatefulWidget {
  final String category;
  const new({super.key,
  required this.category
  });

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
      // final p = products.firstWhere((p)=> p.id == int.parse(widget.id));


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id),
        backgroundColor: Colors.amber,
      ),
      body: Padding(padding: EdgeInsetsGeometry.all(16),
      child: Text('${p.name}'),
      ),
    );
  }
}