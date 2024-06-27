import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/controllers/cart_controller.dart';
import 'package:provider_app/models/product.dart';

// ignore: must_be_immutable
class ProductItem extends StatelessWidget {
  const ProductItem({super.key});
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        color: product.color,
      ),
      title: Text(
        product.title.toString(),
      ),
      subtitle: Text(
        product.price.toString(),
      ),
      trailing: Consumer<CartController>(
        builder: (ctx, cartController, child) {
          return cartController.isProductInCart(product.id)
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        cartController.removeFromCard(product.id);
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text(cartController.getProductCount(product.id).toString()),
                    IconButton(
                      onPressed: () {
                        cartController.addToCard(product);
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                )
              : IconButton(
                  onPressed: () {
                    cartController.addToCard(product);
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                  ),
                );
        },
      ),
    );
  }
}
