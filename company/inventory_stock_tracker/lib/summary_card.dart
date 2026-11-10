import 'package:flutter/material.dart';

Widget summarycard(String title, String value) {
  return Card(
    child: Padding(padding: EdgeInsetsGeometry.all(12),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          SizedBox(height: 5),
          Text(value, style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold
          ),)
      
        ],
      ),
    ),
    ),
    
  );
}