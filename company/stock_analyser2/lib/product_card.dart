import 'package:flutter/material.dart';
import 'package:stock_analyser2/low_stock.dart';
import 'package:stock_analyser2/quantity_stepper.dart';

class ProductCard extends StatelessWidget {
  final String productname;
  final double unitPrice;
  final int quantity;
  final String labl;
 final Widget? icon;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final bool compact;


  const ProductCard({
    super.key,
    this.icon ,
    required this.productname,
    required this.unitPrice,
    required this.quantity,
    required this.compact,
             this.labl = '',

    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(16),
      child: Column(
        children: [
        
          if (compact) ...[
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:compact? Colors.grey[300]: Colors.transparent,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        productname,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    labl,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        'Unit price: $unitPrice',
                        style: TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                      QuantityStepper(
                        value: quantity,
                        onIncrement: () {
                          onIncrement();
                        },
                        onDecrement: () {
                          onDecrement();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 15),
            LowStockLimit(quantity: quantity),
            SizedBox(height: 5),
          ] else ...[
            Text(
              productname,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text('Unit price: $unitPrice', style: TextStyle(fontSize: 20)),
            Text(
              labl,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            QuantityStepper(
              value: quantity,
              onIncrement: () {
                onIncrement();
              },
              onDecrement: () {
                onDecrement();
              },
            ),
            SizedBox(height: 15),
            LowStockLimit(quantity: quantity),
            SizedBox(height: 40),
          ],
        ],
      ),
    );
  }
}
