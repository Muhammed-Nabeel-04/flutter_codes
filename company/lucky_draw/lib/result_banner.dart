import 'package:flutter/material.dart';

class ResultBanner extends StatelessWidget {
  final String prize;
  const ResultBanner({super.key, required this.prize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 150,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        prize,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 25,
        ),
      ),
    );
  }
}
