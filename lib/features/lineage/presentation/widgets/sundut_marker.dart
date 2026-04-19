import 'package:flutter/material.dart';
import 'package:tarombo/core/theme/app_colors.dart';

class SundutMarker extends StatelessWidget {
  final int generation;

  const SundutMarker({super.key, required this.generation});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: AppColors.tertiaryContainer.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(4)),
      child: Text('SUNDUT $generation', style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: AppColors.tertiary, letterSpacing: 1.0)),
    );
  }
}
