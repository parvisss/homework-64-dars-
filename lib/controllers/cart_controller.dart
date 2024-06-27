import 'package:flutter/material.dart';
import 'package:provider_app/models/cart.dart';
import 'package:provider_app/models/product.dart';

class CartController extends ChangeNotifier {
  final Cart _cart = Cart(
    products: {},
    totalPrice: 0,
  );

  void addToCard(Product product) {
    if (isProductInCart(
      product.id,
    )) {
      _cart.products[product.id]["amount"]++;
    } else {
      _cart.products[product.id] = {
        "product": product,
        "amount": 1,
      };
    }

    notifyListeners();
    calculateTotalPrice();
  }

  void removeFromCard(String productId) {
    if (_cart.products[productId]["amount"] == 1) {
      _cart.products.removeWhere(
        (key, value) {
          return key == productId;
        },
      );
    } else {
      _cart.products[productId]["amount"]--;
    }
    notifyListeners();
    calculateTotalPrice();
  }

  

  void calculateTotalPrice() {
    double total = 0;
    _cart.products.forEach(
      (key, value) {
        total += value["product"].price * value["amount"];
      },
    );
    _cart.totalPrice = total;
    notifyListeners();
  }

  Cart get cart {
    return _cart;
  }

  int getProductCount(String productId) {
    return _cart.products[productId]["amount"];
  }

  bool isProductInCart(String prouctId) {
    return _cart.products.containsKey(prouctId);
  }
}
