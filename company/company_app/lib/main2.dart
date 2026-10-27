import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          'BreakFast',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 10,
          
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/icons/navigation-back-arrow-svgrepo-com.svg',
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 30,
            child: SvgPicture.asset('assets/icons/icons8-menu.svg'),
          ),
        ],
      ),
      body: Center(
        child: Text(
          '',
          style: TextStyle(
            fontSize: 35,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.red[600],
        child: Text('click', style: TextStyle(color: Colors.white)),
      ),
    ),
  ),
);