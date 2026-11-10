import 'package:flutter/material.dart';
import 'package:inventory_stock_tracker/add_stock_sheet.dart';
import 'package:inventory_stock_tracker/products_data.dart';
// import 'package:inventory_stock_tracker/products_model.dart';
import 'package:inventory_stock_tracker/stock_card.dart';
import 'package:inventory_stock_tracker/summary_card.dart';

class Inventoryscreen extends StatefulWidget {
  const new({super.key});

  @override
  State<Inventoryscreen> createState() => _InventoryscreenState();
}

class _InventoryscreenState extends State<Inventoryscreen> {

  Future<void> addNewStock()async{
    final newProduct = await showModalBottomSheet(context: context,
    isScrollControlled: true, builder: (context) {
      return AddStockSheet();
    });

    if (newProduct != null){
      setState(() {
        allProductItems.add(newProduct);
      });
    } 
  }
  
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

    // final groupedProducts = {
    //   for (final warehouseItems in Warehouse.values)
    //   Warehouse: allProductItems.where((item) => item.warehouse == warehouseItems).toList()
    // };

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Inventory Stock Tracker',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: addNewStock,
        child: Text('Add'),
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
                childAspectRatio: 2.2,

                children: [
                  summarycard("Total products", totalProducts.toString()),
                  summarycard("Total Quantity", totalQuantity.toString()),
                  summarycard("Inventory value", inventryValue.toString()),
                  summarycard("Low stock", "j"),
                ],
              ),
            ),

            Center(
              child: Text(
                'Inventory Items',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),

            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: allProductItems.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(3),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: StockCard(item: allProductItems[index]),
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
