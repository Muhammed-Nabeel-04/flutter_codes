import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
        title: Text(
          widget.item.name.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        // shape: OutlineInputBorder(),
        
        tileColor: widget.favorite
            ? const Color.fromARGB(255, 250, 144, 137)
            : const Color.fromARGB(255, 204, 223, 238),
        subtitle: Text(widget.item.brand.toString()),
        leading: widget.favorite ? Icon(Icons.favorite, color: Colors.red,) : null,

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
          context.push('/product/${widget.item.id}');
        },
      ),
      
        

    );
  }
}
