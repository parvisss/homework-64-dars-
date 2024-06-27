import 'package:flutter/material.dart';

class Purchases extends ChangeNotifier {
  List<String> purchasesInOne;
  String id;
  double price;
  Purchases({
    required this.purchasesInOne,
    required this.price,
    required this.id,
  });
}
