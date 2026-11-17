import 'package:flutter/material.dart';
import 'package:product_catalogue/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String id ;
  const new({super.key,
  required this.id
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
      final p = products.firstWhere((p)=> p.id == int.parse(widget.id));


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