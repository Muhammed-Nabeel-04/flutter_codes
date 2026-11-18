import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalogue/widgets/list_tile_widget.dart';
import 'package:product_catalogue/product_model.dart';

class ProductListScreen extends StatefulWidget {
  final String category;
  const new({super.key, required this.category});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  bool stockFilterWidget = false;
  double priceRangeWidget = 0;
  bool filter = false;
  String? brandfilterWidget;

  @override
  Widget build(BuildContext context) {


    final categoryFilter = products.where((p) => p.category == widget.category).toList();
    final StockFilter = categoryFilter.where((p) => p.stock > 0).toList();
    final priceFilter = StockFilter.where((p)=> p.price <= priceRangeWidget).toList();
    final brandFilter = priceFilter.where((p)=> p.brand == brandfilterWidget).toList();



    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        backgroundColor: const Color.fromARGB(255, 240, 204, 158),
      ),











      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: 
            
            [
              DrawerHeader(
                child: Text(
                  "Product Catalogue",
                  style: TextStyle(fontSize: 22),
                ),
              ),

              ListTile(leading: Icon(Icons.filter_list), title: Text('Filter'), onTap: () => setState(() {
                filter = !filter;
              }),),
              SizedBox(height: 20),

              if (filter)...[
                SwitchListTile(
                title: Text(
                  "On Stock",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                value: stockFilterWidget,
                onChanged: (value) {
                  setState(() {
                    stockFilterWidget = !stockFilterWidget;
                  });
                },
              ),

              SizedBox(height: 20),

              // Text(priceRange.toStringAsFixed(2)),
              Center(child: Text('Price: ${priceRangeWidget.round()} ₹')),
              Slider(
                value: priceRangeWidget,
                min: 0,
                max: 3000,
                divisions: 15,
                onChanged: (value) {
                  setState(() {
                    priceRangeWidget = value;
                  });
                },
              ),

              SizedBox(height: 20),

              DropdownButton(
                padding: EdgeInsets.all(16),
                value: brandfilterWidget,
                items: [
                  DropdownMenuItem(value: null, child: Text('All brands')),
                  DropdownMenuItem(value: "Sony", child: Text("Sony")),
                  DropdownMenuItem(value: 'Apex', child: Text('Apex')),
                  DropdownMenuItem(value: 'LG', child: Text('LG')),
                ],
                onChanged: (value) {
                  setState(() {
                    brandfilterWidget = value;
                  });
                },
              ),
              ],
              
            ],
          ),
        ),
      ),





















      body: brandFilter.isEmpty
          ? Center(
              child: Text(
                "No Products Available",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            )
          : Padding(
              padding: EdgeInsetsGeometry.all(16),

              child: ListView.builder(
                itemCount: brandFilter.length,
                itemBuilder: (context, i) {
                  final item = brandFilter[i];
                  return ListTileWidget(item: item);
                },
              ),
            ),
    );
  }
}
