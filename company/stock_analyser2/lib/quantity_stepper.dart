import 'package:flutter/material.dart';

class QuantityStepper extends StatelessWidget {
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantityStepper({
    super.key,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        ElevatedButton(
          onPressed: () {
            onDecrement();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey, iconColor: Colors.white, shape: CircleBorder()),
          child: Icon(Icons.remove, fontWeight: FontWeight.bold,),
        ),
        Text('$value', style: const TextStyle(fontSize: 20)),
        ElevatedButton(
          onPressed: () {
            onIncrement();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey, iconColor: Colors.white, shape: CircleBorder()),
          child: Icon(Icons.add, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
