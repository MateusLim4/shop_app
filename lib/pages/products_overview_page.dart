import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';

class ProductsOverviewPage extends StatelessWidget {
  const ProductsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minha Loja"),
      ),
      body: const ProductGrid(),
    );
  }
}
