import 'package:flutter/material.dart';

abstract class IAppColors {
  Color get primary;
  Color get secondary;
  Color get background;
  Color get button;
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
}
