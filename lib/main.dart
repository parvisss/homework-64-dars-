import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/controllers/cart_controller.dart';
import 'package:provider_app/controllers/products_controller.dart';
import 'package:provider_app/views/screens/product_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return CartController();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ProductsController();
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.amber),
        ),
        home:  ProductsScreen(),
      ),
    );
  }
}
