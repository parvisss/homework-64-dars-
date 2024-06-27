import 'package:flutter/material.dart';
import 'package:provider_app/models/product.dart';

class ProductsController extends ChangeNotifier {
  final List<Product> _list = [
    Product(
      id: UniqueKey().toString(),
      title: "Iphone 15",
      price: 124,
      color: Colors.grey,
    ),
    Product(
      id: UniqueKey().toString(),
      title: "Iphone 12",
      price: 100,
      color: Colors.blue,
    ),
  ];
  void editCard(String productId, String title, double price) {
    for (var item in _list) {
      if (item.id == productId) {
        item.title = title;
        item.price = price;
      }
    }
    notifyListeners();
  }

  void addCard(String title, double price) {
    _list.add(
      Product(
        id: UniqueKey().toString(),
        title: title,
        price: price,
        color: Colors.amber,
      ),
    );
    notifyListeners();
  }

  void removeFromCard(String productId) {
    for (var item in _list) {
      if (item.id == productId) {
        _list.remove(item);
      }
    }
    
    notifyListeners();
  }

  List<Product> get list {
    return [..._list];
  }
}
