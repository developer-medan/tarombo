import 'package:flutter/material.dart';
import 'package:tarombo/core/theme/app_colors.dart';

class HorizontalConnector extends StatelessWidget {
  final double widthFactor;

  const HorizontalConnector({super.key, required this.widthFactor});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(widthFactor: widthFactor, child: Container(height: 2, color: AppColors.primary));
  }
}
