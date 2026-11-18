import 'package:flutter/material.dart';
import 'package:product_catalogue/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String id;
  const new({super.key, required this.id});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final item = products.firstWhere((p) => p.id == int.parse(widget.id));
    bool wished = item.wished;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor:  Colors.white70,
        centerTitle: true,
        elevation: 100,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                wished = !wished;
                item.wished = wished;
              });
            },
            icon: Icon(Icons.favorite, size: 30),

            color: wished ? Colors.red : Colors.brown,
          ),
          Padding(padding: EdgeInsetsGeometry.all(8)),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 575,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      item.imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Positioned(
                    bottom: 250,
                    left: 16,
                    right: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '${item.offer} % Discount',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                          Text(
                            '${item.price} ₹',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              height: 600,
              width: double.infinity,
              color: const Color.fromARGB(255, 192, 191, 191),
              child: Column(
                children: [
                  Text(
                    '${item.brand} ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  Text(
                    '${item.name} ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  Text(
                    'Stock left: ${item.stock}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  ...item.specifications.entries.map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '${e.key} : ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  e.value.toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
