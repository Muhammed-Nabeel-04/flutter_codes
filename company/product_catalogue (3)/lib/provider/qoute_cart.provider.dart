import 'package:flutter/material.dart';
import 'package:product_catalogue/model.dart/product_model.dart';

// class QouteCartProvider extends ChangeNotifier {

//   final Map<ProductModel, int> _qouteCart = {};

//   Map<ProductModel, int> get qouteCart => _qouteCart;

//   void addorIncrese(ProductModel item) {
//     // qouteCart.add(products.firstWhere((p) => p == item));

//     qouteCart[item] = (qouteCart[item] ?? 0) + 1;

//     notifyListeners();
//   }

//   void decrese(ProductModel item) {
//     // qouteCart.remove(qouteCart.firstWhere((p) => item == p));

//     if ((qouteCart[item] ?? 0) >= 2) {
//       qouteCart[item] = (qouteCart[item] ?? 0) - 1;
//     } else {
//       qouteCart.remove(item);
//     }

//     notifyListeners();
//   }

//   void delete(ProductModel item) {
//     qouteCart.remove(item);

//     // qouteCart.toSet().toList();
//     notifyListeners();
//   }

//   bool isCarted(ProductModel item) {
//     return qouteCart.containsKey(item);
//   }

//   double get total =>
//       qouteCart.entries.fold(0.0, (sum, e) => sum + e.key.price * e.value);
// }

class QouteCartModel {
  ProductModel product;
  int count;

  QouteCartModel({required this.product, this.count = 1});
}

class QouteCartProvider extends ChangeNotifier {
  final List<QouteCartModel> qouteCartModelList = [];

  int getIndex(ProductModel item) {
    return qouteCartModelList.indexWhere((p) => p.product.id == item.id);
  }

  void add(ProductModel item) {
    final idx = getIndex(item);
    if (idx == -1) {
      qouteCartModelList.add(QouteCartModel(product: item));
    } else {
      qouteCartModelList[idx].count++;
    }

    notifyListeners();
  }

  void increse(ProductModel item) {
    final int idx = getIndex(item);

    if (idx == -1) return;

    qouteCartModelList[idx].count++;

    notifyListeners();
  }

  void decrese(ProductModel item) {
    int idx = getIndex(item);
    if (idx == -1) return;

    if (qouteCartModelList[idx].count > 1) {
      qouteCartModelList[idx].count--;
    } else {
      qouteCartModelList.removeAt(idx);
    }

    notifyListeners();
  }

  void delete(ProductModel item) {
    final idx = getIndex(item);

    if (idx == -1) return;
    qouteCartModelList.removeAt(idx);
    notifyListeners();
  }

  bool isCarted(ProductModel item) {
    // return qouteCartModelList.contains(item);
    // return qouteCartModelList.any((p) => p.product == item);

    return getIndex(item) != -1;
  }

  double get total =>
      qouteCartModelList.fold(0.0, (sum, e) => sum + e.product.price * e.count);
}
