import 'package:flutter/material.dart';
import 'package:product_catalogue/pages/product_details_screen.dart';

class ListTileWidget extends StatefulWidget {
  final item;
  bool favorite;

  new({super.key, required this.item, this.favorite = false});

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 30,
      margin: EdgeInsets.symmetric(vertical: 18),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: "Product-${widget.item.id}",
              child: Image.asset(widget.item.imagePath, fit: BoxFit.cover),
            ),
          ),

          Positioned.fill(
            child: Container(
              color: widget.favorite
                  ? const Color.fromARGB(160, 250, 144, 137)
                  : Color.fromARGB(159, 245, 216, 214),
            ),
          ),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20),
            ),
            title: Text(
              widget.item.name.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            // shape: OutlineInputBorder(),

            // tileColor: widget.favorite
            //     ? const Color.fromARGB(255, 250, 144, 137)
            //     : const Color.fromARGB(255, 204, 223, 238),
            subtitle: Text(widget.item.brand.toString()),
            leading: widget.favorite
                ? Icon(Icons.favorite, color: Colors.red)
                : null,

            trailing: Column(
              children: [
                Text(
                  widget.item.price.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 7),
                Text("Stock left: ${widget.item.stock}"),
              ],
            ),
            minVerticalPadding: 30,

            onTap: () {
              // context.push('/product/${widget.item.id}');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsScreen(id: widget.item.id.toString()),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
