import 'package:flutter/material.dart';

class Inventoryscreen extends StatefulWidget {
  const new({super.key});

  @override
  State<Inventoryscreen> createState() => _InventoryscreenState();
}

class _InventoryscreenState extends State<Inventoryscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory Stock Tracker'),
      ),
    );
  }
}