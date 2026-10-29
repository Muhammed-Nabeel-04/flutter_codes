import 'package:flutter/material.dart';
import 'package:stock_analyser2/product_card.dart';
// import 'package:stock_analyser2/product_card2.dart';

class StockScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  int stockValue = 0;
  int total = 0;
  int unitPrice = 500;

  void incremnt(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void decrement(int index) {
    if (quantities[index] > 0) {
      setState(() {
        quantities[index]--;
      });
    }
  }

  double totalValue() {
    return (quantities[0] * 500.0) +
        (quantities[1] * 1000.0) +
        (quantities[2] * 5000.0);
  }

  void reorder(int index) {
    setState(() {
      quantities[index] = 0;
    });
  }

  List<int> quantities = [10, 20, 30];
  // List<String> productNames = ['Mouse', "laptop", "Car"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Stock Manager',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),

      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Grand Total: ',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${totalValue()}',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),

            ProductCard(
              productname: "Mouse",
              unitPrice: 500,
              quantity: quantities[0],
              onIncrement: () {
                incremnt(0);
              },
              onDecrement: () {
                decrement(0);
              },
              compact: true,
              labl: 'name',
            ),

            ProductCard(
              productname: "LapTop",
              unitPrice: 1000,
              quantity: quantities[1],
              onIncrement: () {
                incremnt(1);
              },
              onDecrement: () {
                decrement(1);
              },
              compact: true,
              labl: 'name',
            ),

            ProductCard(
              productname: "Car",
              unitPrice: 5000,
              quantity: quantities[2],
              onIncrement: () {
                incremnt(2);
              },
              onDecrement: () {
                decrement(2);
              },
              compact: false,
             
            ),
          ],
        ),
      ),
    );
  }
}
