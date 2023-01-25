import 'package:flutter/material.dart';

abstract class IAppColors {
  MaterialColor get primarySwatch;
  Color get primary;
  Color get secondary;
  Color get background;
  Color get button;
  Color get cardBackgroud;
}

class AppColors extends IAppColors {
  @override
  MaterialColor get primarySwatch => MaterialColor(0xffff6600, colorSwatch);
  @override
  Color get primary => const Color.fromARGB(255, 255, 102, 0);
  @override
  Color get secondary => const Color.fromARGB(255, 178, 0, 0);
  @override
  Color get button => const Color.fromARGB(255, 253, 176, 11);
  @override
  Color get background => const Color.fromARGB(255, 254, 244, 192);
  @override
  Color get cardBackgroud => Colors.black54;
}

Map<int, Color> get colorSwatch => {
      50: const Color.fromRGBO(255, 102, 0, .1),
      100: const Color.fromRGBO(255, 102, 0, .2),
      200: const Color.fromRGBO(255, 102, 0, .3),
      300: const Color.fromRGBO(255, 102, 0, .4),
      400: const Color.fromRGBO(255, 102, 0, .5),
      500: const Color.fromRGBO(255, 102, 0, .6),
      600: const Color.fromRGBO(255, 102, 0, .7),
      700: const Color.fromRGBO(255, 102, 0, .8),
      800: const Color.fromRGBO(255, 102, 0, .9),
      900: const Color.fromRGBO(255, 102, 0, 1),
    };
