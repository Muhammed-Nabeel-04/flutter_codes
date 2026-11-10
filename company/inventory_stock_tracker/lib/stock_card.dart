import 'package:flutter/material.dart';
import 'package:inventory_stock_tracker/products_model.dart';

class StockCard extends StatelessWidget {
  final ProductsModel item;
  // DatePickerDialog

  const new({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      child: ListTile(
        contentPadding: EdgeInsets.all(12),
        tileColor: Colors.grey[300],
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: Icon(Icons.inventory_2_outlined),
        ),
        title: Text(
          item.productName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('SKU: ${item.sku}'),
          // Text('Unit price: ${item.uinitPrice}'),
        Text('Stock Value: ${item.stockValue}')
        ]),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Qty: ${item.quantity}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              item.quantity < 10 ? "Low Stock" : "In Stock",
              style: TextStyle(
                fontSize: 12,
                color: item.quantity < 10 ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
