import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/auth/auth.dart';
import 'package:shop_app/models/order/order_list.dart';
import 'package:shop_app/models/product/product_list.dart';
import 'package:shop_app/pages/auth_page.dart';
import 'package:shop_app/pages/cart_page.dart';
import 'package:shop_app/pages/orders_page.dart';
import 'package:shop_app/pages/product_detail_page.dart';
import 'package:shop_app/pages/product_form_page.dart';
import 'package:shop_app/pages/product_page.dart';
import 'package:shop_app/pages/products_overview_page.dart';
import 'package:shop_app/routes/routes.dart';
import 'models/cart/cart.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
        ChangeNotifierProvider(create: (_) => Auth())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ShopApp",
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: AppTheme.colors.primary,
                error: Colors.red[300],
                brightness: Brightness.light),
            useMaterial3: true,
            primarySwatch: AppTheme.colors.primarySwatch,
            fontFamily: GoogleFonts.lato().fontFamily),
        routes: {
          AppRoutes.auth: (context) => const AuthPage(),
          AppRoutes.home: (context) => const ProductsOverviewPage(),
          AppRoutes.productDetail: (context) => const ProductDetailPage(),
          AppRoutes.cart: (context) => const CartPage(),
          AppRoutes.orders: (context) => const OrdersPage(),
          AppRoutes.products: (context) => const ProductPage(),
          AppRoutes.form: (context) => const ProductFormPage(),
        },
      ),
    );
  }
}
