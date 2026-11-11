import 'package:flutter/material.dart';
import 'package:inventory_stock_tracker/add_stock_sheet.dart';
import 'package:inventory_stock_tracker/products_data.dart';
// import 'package:inventory_stock_tracker/products_model.dart';
import 'package:inventory_stock_tracker/stock_card.dart';
import 'package:inventory_stock_tracker/summary_card.dart';
import 'package:inventory_stock_tracker/warehouse_chart.dart';

class Inventoryscreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const new({super.key, required this.isDarkMode, required this.onThemeToggle});

  @override
  State<Inventoryscreen> createState() => _InventoryscreenState();
}

class _InventoryscreenState extends State<Inventoryscreen> {
  Future<void> addNewStock() async {
    final newProduct = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return AddStockSheet();
      },
    );

    if (newProduct != null) {
      setState(() {
        allProductItems.add(newProduct);
      });
    }
  }

  int low = 0;

  // ProductsModel? stack ;
  // int? deletedindex ;

  // void undo(String item) {
  //   if (stack.isNotEmpty) {
  //     stack.add(item);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final totalProducts = allProductItems.length;
    final totalQuantity = allProductItems.fold(
      0,
      (sum, quantity) => sum + quantity.quantity,
    );
    final inventryValue = allProductItems.fold(
      0.0,
      (sum, item) => sum + (item.uinitPrice * item.quantity),
    );

    int lowStock() {
      return low = allProductItems.where((items) => items.quantity < 10).length;
    }

    // final groupedProducts = {
    //   for (final warehouseItems in Warehouse.values)
    //   Warehouse: allProductItems.where((item) => item.warehouse == warehouseItems).toList()
    // };

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        title: Text(
          'Inventory Stock Tracker',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        // backgroundColor: Colors.blueGrey,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: widget.onThemeToggle,
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: addNewStock,

        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Text(
          'Add',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.all(16),

        // child: Column(
        //   spacing: 10,
        //   children: [
        //     Row(
        //       spacing: 10,
        //       children: [
        //         Container(
        //           height: 150,
        //           width: 180,
        //           decoration: BoxDecoration(
        //             color: Colors.blue,
        //             borderRadius: BorderRadius.circular(20),
        //           ),
        //         ),
        //         Container(
        //           height: 150,
        //           width: 180,
        //           decoration: BoxDecoration(
        //             color: Colors.blue,
        //             borderRadius: BorderRadius.circular(20),
        //           ),
        //         ),
        //       ],
        //     ),
        //      Row(
        //   spacing: 10,
        //   children: [
        //     Container(
        //       height: 150,
        //       width: 180,
        //       decoration: BoxDecoration(
        //         color: Colors.blue,
        //         borderRadius: BorderRadius.circular(20),
        //       ),
        //     ),
        //     Container(
        //       height: 150,
        //       width: 180,
        //       decoration: BoxDecoration(
        //         color: Colors.blue,
        //         borderRadius: BorderRadius.circular(20),
        //       ),
        //     ),
        //   ],
        // ),
        //   ],
        // ),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 2,

                children: [
                  summarycard("Total products", totalProducts.toString()),
                  summarycard("Total Quantity", totalQuantity.toString()),
                  summarycard("Inventory value", "$inventryValue ₹"),
                  summarycard("Low stock", '${lowStock()} Items'),
                ],
              ),
            ),
            WarehouseChart(),

            Center(
              child: Text(
                'Inventory Items',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),

            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: allProductItems.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final item = allProductItems[index];

                  return Dismissible(
                    key: ValueKey(item.id),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.error,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.delete),
                    ),

                    onDismissed: (direction) {
                      setState(() {
                        allProductItems.remove(item);
                        // stack = item;
                        // deletedindex = index;
                      });
                      // print(MediaQuery.of(context).accessibleNavigation);
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${item.productName} deleted'),
                          // content: Text('${stack!.productName} deleted'),
                          action: SnackBarAction(
                            label: 'UNDO',
                            onPressed: () {
                              setState(() {
                                // allProductItems.insert(deletedindex!, stack!);
                                allProductItems.insert(index, item);
                              });
                            },
                          ),
                          duration: const Duration(seconds: 3),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(3),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: StockCard(item: allProductItems[index]),
                    ),
                  );
                },
              ),
            ),

            // AddStockSheet()
          ],
        ),
      ),
    );
  }
}
