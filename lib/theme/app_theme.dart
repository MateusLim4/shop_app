import 'package:shop_app/theme/app_colors.dart';

class AppTheme {
  static AppTheme instance = AppTheme();

  final _colors = AppColors();
  static get colors => instance._colors;
}
