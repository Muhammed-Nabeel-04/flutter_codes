import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalogue/widgets/grid_view_widget.dart';

class CategoryScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<String> categories = [
    'Electronics',
    'Furniture',
    'Stationery',
    'Apparel',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Catalogue',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),

      

      body: Padding(
        padding: EdgeInsetsGeometry.all(16),

        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: categories
              .map((c) => categoriesWidget(c, ()=> context.push('/category/$c')))
              .toList(),
        ),



      ),
    );
  }
}
