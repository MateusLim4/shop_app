import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product/product.dart';
import 'package:shop_app/models/product/product_list.dart';
import 'package:shop_app/routes/routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final msg = ScaffoldMessenger.of(context);

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.form, arguments: product);
              },
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: const Text("Deseja excluir?"),
                      content: const Text(
                          "Deseja realmente realizar a exclusão do produto? A Ação não pode ser desfeita!"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text("Não"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: const Text("Sim"),
                        ),
                      ],
                    );
                  },
                ).then((value) async {
                  if (value) {
                    try {
                      await Provider.of<ProductList>(context, listen: false)
                          .removeProduct(product);
                    } catch (e) {
                      msg.showSnackBar(SnackBar(
                        content: Text(
                          e.toString(),
                        ),
                      ));
                    }
                  }
                });
              },
              icon: const Icon(Icons.delete),
            )
          ],
        ),
      ),
      title: Text(product.title),
    );
  }
}
