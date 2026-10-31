import 'package:flutter/material.dart';

class PlayerInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAdd;

  const new({super.key, required this.controller, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,

          decoration: InputDecoration(
            hintText: 'Enter player name',
            hintStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
            fillColor: Colors.white70,
            filled: true,
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: onAdd,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white70),
          child: Text('Add Player', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
