import 'package:flutter/material.dart';

abstract class IAppColors {
  Color get primary;
  Color get secondary;
  Color get background;
  Color get button;
  MaterialColor get primarySwatch;
}

class AppColors extends IAppColors {
  @override
  Color get primary => const Color.fromARGB(255, 178, 0, 0);
  @override
  Color get secondary => const Color.fromARGB(255, 254, 133, 53);
  @override
  Color get button => const Color.fromARGB(255, 253, 176, 11);
  @override
  Color get background => const Color.fromARGB(255, 254, 244, 192);

  @override
  MaterialColor get primarySwatch => MaterialColor(0xffb20000, colorSwatch);
}

Map<int, Color> get colorSwatch => {
      50: const Color.fromRGBO(178, 0, 0, .1),
      100: const Color.fromRGBO(178, 0, 0, .2),
      200: const Color.fromRGBO(178, 0, 0, .3),
      300: const Color.fromRGBO(178, 0, 0, .4),
      400: const Color.fromRGBO(178, 0, 0, .5),
      500: const Color.fromRGBO(178, 0, 0, .6),
      600: const Color.fromRGBO(178, 0, 0, .7),
      700: const Color.fromRGBO(178, 0, 0, .8),
      800: const Color.fromRGBO(178, 0, 0, .9),
      900: const Color.fromRGBO(178, 0, 0, 1),
    };
