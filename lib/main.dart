import 'package:flutter/material.dart';
import 'package:shop_app/pages/products_overview_page.dart';

import 'theme/app_theme.dart';

void main() {
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ShopApp",
      theme: ThemeData(primarySwatch: AppTheme.colors.primarySwatch),
      home: ProductsOverviewPage(),
    );
  }
}
