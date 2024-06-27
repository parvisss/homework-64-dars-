import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/controllers/cart_controller.dart';
import 'package:provider_app/models/product.dart';
import 'package:provider_app/views/screens/purchases.dart';
import 'package:provider_app/views/widgets/product_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);
    final products = cartController.cart.products;
    return Scaffold(
      appBar: AppBar(
        title: const Text("S A V A T C H A"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: products.isEmpty
          ? const Center(
              child: Text("Savatchangiz bo'sh. Mahsulot qo'shing!"),
            )
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (ctx, index) {
                final product = products.values.toList()[index]['product'];
                return ChangeNotifierProvider<Product>.value(
                  value: product,
                  child: const ProductItem(),
                );
              },
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.amber,
        extendedPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        label: Text(
          "\$${cartController.cart.totalPrice}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
