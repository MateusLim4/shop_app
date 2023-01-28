import 'package:flutter/material.dart';
import 'package:shop_app/theme/app_theme.dart';

class BadgeWidget extends StatelessWidget {
  final Widget child;
  final String value;
  final Color? color;
  const BadgeWidget(
      {Key? key, required this.child, required this.value, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color ?? AppTheme.colors.secondary),
              constraints: const BoxConstraints(minHeight: 16, minWidth: 16),
              child: Text(
                value,
                style: const TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
              ),
            ))
      ],
    );
  }
}
