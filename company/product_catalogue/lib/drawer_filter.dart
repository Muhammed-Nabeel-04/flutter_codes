import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalogue/product_model.dart';

class DrawerFilter extends StatefulWidget {
  final String category;
  const new({super.key, required this.category});

  @override
  State<DrawerFilter> createState() => _DrawerFilterState();
}

final FilterModel filterdetails = FilterModel();

class _DrawerFilterState extends State<DrawerFilter> {
   bool stockFilterWidget = filterdetails.stockFilterWidget;
   double priceRangeWidget = filterdetails.priceRangeWidget;
   String? brandfilterWidget = filterdetails.brandfilterWidget;

  @override
  Widget build(BuildContext context) {
    // filtering() {
    //   final categoryFilter = products
    //       .where(
    //         (p) => p.category == widget.category,
    //         // && (stockFilterWidget)
    //         //     ? p.stock > 0
    //         //     : p.stock >= 0 && p.price <= priceRangeWidget ||
    //         //           p.brand == brandfilterWidget,
    //       )
    //       .toList();
    //   final stockFilter = categoryFilter.where((p) => p.stock > 0).toList();
    //   final priceFilter = stockFilter
    //       .where((p) => p.price <= priceRangeWidget)
    //       .toList();
    //   return priceFilter.where((p) => p.brand == brandfilterWidget).toList();
    // }

    filtering() {
      return products
          .where(
            (p) =>
                p.category == widget.category &&
                ((!stockFilterWidget) || p.stock > 0) &&
                p.price <= priceRangeWidget &&
                ((brandfilterWidget == null) || p.brand == brandfilterWidget),
          )
          .toList();

      // final stockFilter = categoryFilter.where((p) => p.stock > 0).toList();
      // final priceFilter = stockFilter
      //     .where((p) => p.price <= priceRangeWidget)
      //     .toList();
      // return priceFilter.where((p) => p.brand == brandfilterWidget).toList();
    }

    final brandsDropdown = products
        .where((p) => p.category == widget.category)
        .map((p) => p.brand)
        .toSet()
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text("Product Catalogue")),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // DrawerHeader(
            //   child: Text(
            //     "Product Catalogue",
            //     style: TextStyle(fontSize: 22),
            //   ),
            // ),

            SizedBox(height: 20),

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
            Center(child: Text('Price: ${priceRangeWidget.round()} ₹', style: TextStyle(fontWeight: FontWeight.bold),)),
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
                // DropdownMenuItem(value: "Sony", child: Text("Sony")),
                // DropdownMenuItem(value: 'Apex', child: Text('Apex')),
                // DropdownMenuItem(value: 'LG', child: Text('LG')),

                ...brandsDropdown.map(
                  (p) => DropdownMenuItem(value: p, child: Text(p)),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  brandfilterWidget = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  stockFilterWidget = false;
                  priceRangeWidget = 1000;
                  brandfilterWidget = null;
                  filterdetails.stockFilterWidget = stockFilterWidget;
                filterdetails.priceRangeWidget = priceRangeWidget;
                filterdetails.brandfilterWidget = brandfilterWidget;
                });
              },
              child: Text('Reset'),
            ),
            ElevatedButton(
              onPressed: () {
                filterdetails.stockFilterWidget = stockFilterWidget;
                filterdetails.priceRangeWidget = priceRangeWidget;
                filterdetails.brandfilterWidget = brandfilterWidget;
                context.pop(filtering());
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
