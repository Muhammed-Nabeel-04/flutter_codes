import 'package:flutter/material.dart';
import 'package:product_catalogue/widgets/model.dart/product_model.dart';

class QouteCartProvider extends ChangeNotifier {
  final Map<ProductModel, int> _qouteCart = {};

  Map<ProductModel, int> get qouteCart => _qouteCart;

  void addorIncrese(ProductModel item) {
    // qouteCart.add(products.firstWhere((p) => p == item));

    qouteCart[item] = (qouteCart[item] ?? 0) + 1;

    notifyListeners();
  }

  void decrese(ProductModel item) {
    // qouteCart.remove(qouteCart.firstWhere((p) => item == p));

    if ((qouteCart[item] ?? 0) >= 2) {
      qouteCart[item] = (qouteCart[item] ?? 0) - 1;
    }
    else {
      qouteCart.remove(item);
    }

    notifyListeners();
  }

  void delete(ProductModel item) {
    // qouteCart.where((p) => qouteCart.remove(item));
    // if ((qouteCart[item] ?? 0) == 1) {
      qouteCart.remove(item);
    // }

    // qouteCart.toSet().toList();
    notifyListeners();
  }

  bool isCarted(ProductModel item){
    return qouteCart.containsKey(item);
  }

  


  double get total => qouteCart.entries.fold(0.0, (sum , e) => sum + e.key.price * e.value);

}
