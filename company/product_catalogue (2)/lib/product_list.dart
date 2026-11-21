import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalogue/provider/filter_provider.dart';
import 'package:product_catalogue/provider/product_provider.dart';
import 'package:product_catalogue/widgets/list_tile_widget.dart';
import 'package:product_catalogue/widgets/model.dart/product_model.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  final String category;
  const new({super.key, required this.category});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  // List<ProductModel>? filterdItems;




  
  @override
  Widget build(BuildContext context) {

    // final filterProvider = context.watch<FilterProvider>();
    final allProductItems =context.watch<ProductProvider>().items;
    final finalFilter = context.watch<FilterProvider>().apply(allProductItems, widget.category);


    // final categoryFilter = products
        // .where((p) => p.category == widget.category)
        // .toList();
    // final finalFilter = filterdItems ?? categoryFilter;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        backgroundColor: const Color.fromARGB(255, 240, 204, 158),
      ),

      drawer: Drawer(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: ListView(
            children: [
              DrawerHeader(child: Text('Product Cataloge')),

              ListTile(
                title: Text('Filters'),
                trailing: Icon(Icons.filter_list),
                onTap: () async {
                   await context.push(
                    '/filters',
                    extra: widget.category,
                  );
                  context.pop();

                },
              ),
            ],
          ),
        ),
        
      ),

      body: finalFilter.isEmpty
          ? Center(
              child: Text(
                "No Products Available",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            )
          : Padding(
              padding: EdgeInsetsGeometry.all(16),

              child: ListView.builder(
                itemCount: finalFilter.length,
                itemBuilder: (context, i) {
                  final item = finalFilter[i];
                  return ListTileWidget(item: item);
                },
              ),
            ),
    );
  }
}
