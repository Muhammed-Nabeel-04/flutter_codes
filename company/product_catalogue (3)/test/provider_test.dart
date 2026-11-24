import 'package:flutter_test/flutter_test.dart';
import 'package:product_catalogue/provider/qoute_cart.provider.dart';
import 'package:product_catalogue/provider/whishlist_provider.dart';
import 'package:product_catalogue/model.dart/product_model.dart';

void main() {
  test('Whishlist togggle adds then removes a product', () {
    final wishlist = WhishlistProvider();
    final product = products.first;

    var notified = 0;
    wishlist.addListener(() => notified++);

    wishlist.toggle(product);
    expect(wishlist.isWhished(product), true);
    expect(wishlist.items.length, 1);

    wishlist.toggle(product);
    expect(wishlist.isWhished(product), false);
    expect(wishlist.items.length, 0);

    expect(notified, 2);
  });

  // test('Qoute cart quantity and total update correctly', () {
  //   final cart = QouteCartProvider();
  //   final product = products.first;

  //   cart.addorIncrese(product);
  //   // cart.addorIncrese(product);
  //   expect(cart.qouteCart[product], 1);
  //   expect(cart.total, product.price);

  //   cart.decrese(product);
  //   expect(cart.qouteCart.containsKey(product), false);
  //   expect(cart.total, 0);
  // });
}
