import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/controllers/products_controller.dart';

class ButtonAdd extends StatelessWidget {
  ButtonAdd({super.key});
  final titleController = TextEditingController();

  final priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final productsController = Provider.of<ProductsController>(context);

    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Add"),
                  const Gap(20),
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Title"),
                  ),
                  const Gap(10),
                  TextField(
                    controller: priceController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Price"),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    productsController.addCard(
                      titleController.text,
                      double.parse(priceController.text),
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
