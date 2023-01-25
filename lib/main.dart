import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/pages/product_detail_page.dart';
import 'package:shop_app/pages/products_overview_page.dart';
import 'package:shop_app/routes/routes.dart';

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
      theme: ThemeData(
          primarySwatch: AppTheme.colors.primarySwatch,
          backgroundColor: AppTheme.colors.background,
          fontFamily: GoogleFonts.lato().fontFamily),
      home: ProductsOverviewPage(),
      routes: {AppRoutes.productDetail: (context) => const ProductDetailPage()},
    );
  }
}
