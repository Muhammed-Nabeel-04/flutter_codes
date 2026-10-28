import 'package:flutter/material.dart';

class Stockanalyser extends StatefulWidget {
  const new({super.key});

  @override
  State<Stockanalyser> createState() => _StockanalyserState();
}

class _StockanalyserState extends State<Stockanalyser> {
  int quantity = 0;
  int stockValue = 0;
  int total = 0;
  int unitPrice = 500;

    void incremnt() {
      setState(() {
        quantity++;
      });
    }

    void decrement() {
      if (quantity > 0) {
        setState(() {
          quantity--;
        });
      }
    }

    double totalValue() {
      return (quantity * unitPrice).toDouble();
    }

    void reorder() {
      setState(() {
        quantity = 0;
      });
    }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Stock Quantity Adjuster',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        
          padding: EdgeInsetsGeometry.all(10),
        
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
        
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Mouse', style: TextStyle(fontSize: 35)),
                  Text('Unit price: $unitPrice ₹', style: TextStyle(fontSize: 22)),
                  SizedBox(height: 16),
        
                  Row(
                    spacing: 20,
                    children: [
                      ElevatedButton(
                        onPressed:quantity==0?null: decrement,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                        ),
                        child: Icon(Icons.remove, size: 30, color: Colors.white),
                      ),
                      ElevatedButton(
                        onPressed: incremnt,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                        ),
                        child: Icon(Icons.add, size: 30, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    //column
                    children: [
                      Text('Quantity: $quantity', style: TextStyle(fontSize: 20)),
                      Text(
                        'Total stock value: ${totalValue()} ₹',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed:quantity==0? null: reorder,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                        ),
                        child: Text(
                          'ReOrder',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20),
                      // if (quantity >= 5)
                      //   Text("",style: TextStyle(fontSize: 15),),
                      if (quantity < 5)
                        Text(
                          'Low Stock !',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.red[900],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                  
                ],
              ),
            ],
          ),
        ));
  }
}
