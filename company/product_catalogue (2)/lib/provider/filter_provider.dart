import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:product_catalogue/model.dart/product_model.dart';

class FilterProvider extends ChangeNotifier{
  bool _inStockOnly = false;
  double _maxPrice = 3000;
  String? _brand;
  



  bool get inStockOnly => _inStockOnly;
  double get maxPrice => _maxPrice;
  String? get brand => _brand;

  void setInStockOnly(bool v){
    _inStockOnly = v;
    notifyListeners();
  }

  void setMaxPrice(double v){
    _maxPrice = v;
    notifyListeners();
  }

  void setBrand(String? v){
    _brand = v;
    notifyListeners();
  }

  void reset(){
    _inStockOnly =false;
    _maxPrice = 3000;
    _brand = null;
    notifyListeners();
  }
  

  List<String> brandsDropdown(List<ProductModel>all, String category ){
     return all.where((p) => p.category == category)
    .map((p) => p.brand).toSet().toList();
  }   

  List<ProductModel> apply(List<ProductModel> all, String category,){
    return all.where((p)=> p.category == category && (!inStockOnly || p.stock>0)&&
    p.price <= _maxPrice && (_brand == null || p.brand == _brand)).toList();
  }
}