import 'package:flutter/material.dart';
import 'package:stock_analyser2/quantity_stepper.dart';

class ProductCard2 extends StatelessWidget {
  final String productname;
  final double unitPrice;
  final int quantity;

  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final bool compact;

  const ProductCard2({
    super.key,
    required this.productname,
    required this.unitPrice,
    required this.quantity,
    required this.compact,

    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            
            title: Text(productname),
            subtitle: Text('Unit rice: $unitPrice'),
          ),
          
          Row(
            
            children: [
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
    );
  }
}
