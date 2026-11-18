import 'package:flutter/material.dart';

Widget categoriesWidget(String category, VoidCallback onTap) {
  return Material(
    color: Colors.teal[100],
    borderRadius: BorderRadius.circular(16),
    child: InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Text(
          category,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    ),
  );
}
