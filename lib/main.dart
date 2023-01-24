import 'package:flutter/material.dart';

void main() {
  runApp(ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ShopApp",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My app"),
        ),
        body: const Center(
          child: Text("My App"),
        ),
      ),
    );
  }
}
