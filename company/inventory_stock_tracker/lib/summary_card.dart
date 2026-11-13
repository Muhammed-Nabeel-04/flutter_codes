import 'package:flutter/material.dart';

Widget summarycard(String title, String value, bool isTablet) {
  return Card(
    child: Padding(
      padding: EdgeInsetsGeometry.all(12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isTablet) ...[
              Text(title, style: TextStyle(fontSize: 25)),
              SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ] else ...[
              Text(title),
              SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ],
        ),
      ),
    ),
  );
}
