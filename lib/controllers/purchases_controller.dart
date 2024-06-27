// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:provider_app/models/purchases.dart';

// class PurchasesController extends ChangeNotifier {
//   // ignore: non_constant_identifier_names
//   final List allPurchases = [
//     Purchases(
//       purchasesInOne: [],
//       price: 0,
//       id: UniqueKey().toString(),
//     ),
//   ];

//   void addPurchased(String title, double price) {
//     allPurchases[title]?.purchasesInOne.add(title);
//     allPurchases[title]?.purchasesInOne.forEach((value) {
//       allPurchases[title]?.price += price;
//     });
//   }

//   Purchases purchases(String title) {
//     return allPurchases[title];
//   }
// }
