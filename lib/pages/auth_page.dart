import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/widgets/auth_form_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(215, 117, 225, 0.5),
              Color.fromRGBO(255, 188, 117, 0.9)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).colorScheme.primary,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8,
                          color: Theme.of(context).colorScheme.onPrimary,
                          offset: const Offset(0, 2)),
                    ]),
                child: Text(
                  "Minha Loja",
                  style: TextStyle(
                    fontSize: 45,
                    fontFamily: GoogleFonts.anton().fontFamily,
                    color: Colors.white,
                  ),
                ),
              ),
              const AuthForm(),
            ],
          ),
        )
      ]),
    );
  }
}
