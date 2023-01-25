import 'package:flutter/material.dart';
import 'package:shop_app/routes/routes.dart';
import '../models/product.dart';
import '../theme/app_theme.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          title: Text(product.title),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          ),
          backgroundColor: AppTheme.colors.cardBackgroud,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRoutes.productDetail,
              arguments: product,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}