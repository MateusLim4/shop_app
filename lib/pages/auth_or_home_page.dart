import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/pages/auth_page.dart';
import 'package:shop_app/pages/products_overview_page.dart';

import '../models/auth/auth.dart';

class AuthOrHomepage extends StatelessWidget {
  const AuthOrHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? ProductsOverviewPage() : AuthPage();
  }
}
