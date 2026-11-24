import 'package:flutter/material.dart';
import 'package:product_catalogue/model.dart/product_model.dart';

class ProductProvider extends ChangeNotifier {
  final List<ProductModel> _items = List.of(products);
 
  List<ProductModel> get items => List.unmodifiable(_items);
}
