import 'package:flutter/material.dart';
import 'package:product_catalogue/model.dart/product_model.dart';


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
    } else {
      qouteCart.remove(item);
    }

    notifyListeners();
  }

  void delete(ProductModel item) {
    qouteCart.remove(item);

    // qouteCart.toSet().toList();
    notifyListeners();
  }

  bool isCarted(ProductModel item) {
    return qouteCart.containsKey(item);
  }

  double get total =>
      qouteCart.entries.fold(0.0, (sum, e) => sum + e.key.price * e.value);
}











// class QouteCartModel{
//   ProductModel product;
//   int count ;

//   QouteCartModel({
//     required this.product,
//     required this.count
//   });
// }





// class QouteCartProvider extends ChangeNotifier {
  



// final List<QouteCartModel> qouteCartModelList = [];

// int getIndex(ProductModel item) {
//   return qouteCartModelList.indexWhere((p)=> p.product.id == item.id);
// } 



//   void addorIncrese(ProductModel item) {
    
    

//     // qouteCartModelList.add(QouteCartModel(product: item, count: 1));

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












