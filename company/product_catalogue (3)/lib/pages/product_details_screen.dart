import 'package:flutter/material.dart';
import 'package:product_catalogue/provider/product_provider.dart';
import 'package:product_catalogue/provider/qoute_cart.provider.dart';
import 'package:product_catalogue/provider/whishlist_provider.dart';
import 'package:product_catalogue/widgets/specification_widget.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String id;
  const new({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final item = context.watch<ProductProvider>().items.firstWhere(
      (p) => p.id == int.parse(id),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white70,
        centerTitle: true,
        elevation: 100,

        actions: [
          Consumer<WhishlistProvider>(
            builder: (context, wish, _) => IconButton(
              onPressed: () => context.read<WhishlistProvider>().toggle(item),

              icon: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
                child: Icon(
                  wish.isWhished(item) ? Icons.favorite : Icons.favorite_border,
                  key: ValueKey(wish.isWhished(item)),
                  // key: ValueKey(false),
                  color: wish.isWhished(item) ? Colors.red : Colors.brown,
                  size: 28,
                ),
              ),
            ),
          ),

          Consumer<QouteCartProvider>(
            builder: (context, cart, _) => IconButton(
              onPressed: () {
                cart.isCarted(item)
                    ? cart.delete(item)
                    : context.read<QouteCartProvider>().add(item);
              },

              icon: AnimatedSwitcher(
                duration: Duration(milliseconds: 400),
                switchInCurve: Curves.elasticOut,
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
                child: Icon(
                  Icons.card_travel,
                  size: 27,
                  key: ValueKey(cart.isCarted(item)),
                  color: cart.isCarted(item) ? Colors.black : Colors.grey,
                ),
              ),
            ),
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
                    child: Hero(
                      tag: "Product-$id",
                      child: Image.asset(
                        item.imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 250,
                    left: 16,
                    right: 16,
                    // top: 15,
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
              // constraints:  BoxConstraints(minHeight: 600), // to avoid overflow when there is more specifications added(container need more space)
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

                  SpecificationWidget(spec: item.specifications),

                  // ...item.specifications.entries.map(
                  //   (e) => Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Column(
                  //       children: [
                  //         Container(
                  //           padding: EdgeInsets.all(16),
                  //           decoration: BoxDecoration(
                  //             color: Colors.white,
                  //             borderRadius: BorderRadius.circular(16),
                  //           ),
                  //           child: Row(
                  //             children: [
                  //               Text(
                  //                 '${e.key} : ',
                  //                 style: TextStyle(
                  //                   fontSize: 20,
                  //                   fontWeight: FontWeight.bold,
                  //                   color: Colors.black,
                  //                 ),
                  //               ),
                  //               Text(
                  //                 e.value.toString(),
                  //                 style: TextStyle(
                  //                   fontSize: 20,
                  //                   fontWeight: FontWeight.bold,
                  //                   color: Colors.green,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
