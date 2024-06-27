import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/controllers/products_controller.dart';
import 'package:provider_app/views/screens/cart_screen.dart';
import 'package:provider_app/views/widgets/button_add.dart';
import 'package:provider_app/views/widgets/product_item.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final titleController = TextEditingController();

  final priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final productsController = Provider.of<ProductsController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("D I N A M O"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return const CartScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productsController.list.length,
        itemBuilder: (ctx, index) {
          final product = productsController.list[index];
          return ChangeNotifierProvider.value(
            value: product,
            child: Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.blue,
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Text(
                        "Edit",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                child: const Stack(
                  children: [
                    Positioned(
                      right: 18,
                      top: 24,
                      child: Text(
                        "Remove",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.startToEnd) {
                  titleController.text = product.title;
                  priceController.text = product.price.toString();
                  await showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("Edit"),
                            const SizedBox(height: 20),
                            TextField(
                              controller: titleController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Title",
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: priceController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Price",
                              ),
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                product.title = titleController.text;
                                product.price =
                                    double.parse(priceController.text);
                              });
                              Navigator.of(ctx).pop();
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                  return false;
                } else if (direction == DismissDirection.endToStart) {
                  return await showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: const Text("Remove Item"),
                        content: const Text(
                            "Are you sure you want to remove this item?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop(false);
                            },
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              productsController.removeFromCard(product.id);

                              Navigator.of(ctx).pop(true);
                            },
                            child: const Text("Remove"),
                          ),
                        ],
                      );
                    },
                  );
                }
                return false;
              },
              child: const ProductItem(),
            ),
          );
        },
      ),
      floatingActionButton: ButtonAdd(),
    );
  }
}
