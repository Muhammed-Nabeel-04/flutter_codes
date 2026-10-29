import 'package:flutter/material.dart';

class LowStockLimit extends StatelessWidget {
  final int quantity;

  const LowStockLimit({super.key,
  required this.quantity
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (quantity >= 5)
        Text('', style: TextStyle(color: Colors.red, fontSize: 16),),
        if(quantity < 5)
        Text('Low Stock !', style: TextStyle(color: Colors.red, fontSize: 16),)
      ],
      
    );
  }
}