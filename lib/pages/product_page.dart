import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/pages/product_item.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/widgets/app_drawer.dart';

import '../models/product/product_list.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerenciar Produtos"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.form);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: products.countItens,
          itemBuilder: (ctx, index) {
            return Column(
              children: [
                ProductItem(
                  product: products.items[index],
                ),
                const Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
