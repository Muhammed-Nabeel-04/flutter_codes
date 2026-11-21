import 'package:flutter/material.dart';
import 'package:product_catalogue/provider/filter_provider.dart';
import 'package:product_catalogue/provider/product_provider.dart';
import 'package:product_catalogue/widgets/model.dart/product_model.dart';
import 'package:provider/provider.dart';

class DrawerFilter extends StatelessWidget {
  final String category;
  const new({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // final brandsDropdown =  context.watch<FilterProvider>().brandsDropdown(products, category);
    //  final filter = context.watch<FilterProvider>();

    final allproductItems = context.watch<ProductProvider>().items;


    return Scaffold(
      appBar: AppBar(title: Text("Product Catalogue")),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 20),

            SwitchListTile(
              title: Text(
                "On Stock",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              value: context.watch<FilterProvider>().inStockOnly,
              onChanged: (value) =>
                  // stockFilterWidget = !stockFilterWidget;
                  context.read<FilterProvider>().setInStockOnly(value),
            ),

            SizedBox(height: 20),

            Center(
              child: Text(
                'Price: ${context.read<FilterProvider>().maxPrice.round()} ₹',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            Slider(
              value: context.watch<FilterProvider>().maxPrice,
              min: 0,
              max: 3000,
              divisions: 15,
              onChanged: (value) =>
                  context.read<FilterProvider>().setMaxPrice(value),
            ),

            SizedBox(height: 20),

            DropdownButton(
              padding: EdgeInsets.all(16),
              value: context.watch<FilterProvider>().brand,
              items: [
                DropdownMenuItem(value: null, child: Text('All brands')),

                ...context.watch<FilterProvider>().brandsDropdown(allproductItems, category).map(
                  (p) => DropdownMenuItem(value: p, child: Text(p)),
                ),
               ],


              
              onChanged: (value) =>
                  context.read<FilterProvider>().setBrand(value),
            ),
            ElevatedButton(
              onPressed: () => context.read<FilterProvider>().reset(),

              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}

final FilterModel filterdetails = FilterModel();
