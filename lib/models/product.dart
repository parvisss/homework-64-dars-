import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  final String id;
  String title;
  double price;
  Color color;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.color,
  });
}
