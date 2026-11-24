import 'package:flutter/material.dart';
import 'package:product_catalogue/provider/qoute_cart.provider.dart';
import 'package:provider/provider.dart';

class QouteCart extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final qouteCart = context.watch<QouteCartProvider>().qouteCart;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: 
      
      
      Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: ListView.separated(
          
          itemCount: qouteCart.length,
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemBuilder: (context, i) {
            final item = qouteCart.entries.toList();

            return  ListTile(
              
                tileColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16),
                ),
                            
                title: Text(
                  item[i].key.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                subtitle: Text(item[i].key.brand.toString(), style: TextStyle(color: Colors.black),),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<QouteCartProvider>().decrese(item[i].key);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        iconSize: 30,
                        shape: CircleBorder(),
                      ),
                      child: Icon(Icons.remove, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      '${item[i].value}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black
                      ),
                    ),
                            
                    ElevatedButton(
                      onPressed: () {
                        context.read<QouteCartProvider>().addorIncrese(
                          item[i].key,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        iconSize: 30,
                        shape: CircleBorder(),
                      ),
                            
                      child: Icon(Icons.add, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
              );
            
          },
        ),
      ),
    );
  }
}
