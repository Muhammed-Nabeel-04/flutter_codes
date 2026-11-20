import 'package:flutter/material.dart';
import 'package:product_catalogue/widgets/model.dart/product_model.dart';

class WhishlistProvider extends ChangeNotifier{
  final List<ProductModel> _items = [...products.where((p)=> p.wished)];

  List<ProductModel> get items=> List.unmodifiable(_items);

  bool isWhished(ProductModel p) => _items.any((x) => x.id == p.id);

  void add(ProductModel p){
    if (!isWhished(p)){
      _items.add(p);
      notifyListeners();
    }
  }

  void remove(ProductModel p){
    _items.removeWhere((x) => x.id == p.id);
    notifyListeners();
  }

  void toggle(ProductModel p){
    if (isWhished(p)){
      remove(p);
    }
    else{
      add(p);
    }
  }

  
}