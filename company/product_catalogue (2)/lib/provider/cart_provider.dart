import 'package:flutter/material.dart';
import 'package:product_catalogue/widgets/model.dart/product_model.dart';

class CartProvider extends ChangeNotifier {
  final Map<ProductModel, int> _items = {};

  Map<ProductModel, int> get items => Map.unmodifiable(_items);

  int quantityOf(ProductModel p)=> _items[p] ?? 0;

  void add(ProductModel p){
    _items[p] = quantityOf(p) + 1;
    notifyListeners();
  }

  void increase(ProductModel p)=> add(p);

  void decrese(ProductModel p){
    final q = quantityOf(p);
    if (q <= 1){
      _items.remove(p);
    }else{
      _items[p] = q-1;
    }
    notifyListeners();
  }
  void remove(ProductModel p){
    _items.remove(p);
    notifyListeners();

  }
  double get total => _items.entries.fold<double>(0, (sum, e) => sum + e.key.price * e.value);
}