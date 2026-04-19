import 'package:flutter/material.dart';
import 'package:tarombo/core/theme/app_colors.dart';

class VerticalConnector extends StatelessWidget {
  final double height;

  const VerticalConnector({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(width: 2, height: height, color: AppColors.primary);
  }
}
