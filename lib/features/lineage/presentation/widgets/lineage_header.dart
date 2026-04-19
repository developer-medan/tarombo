import 'package:flutter/material.dart';
import 'package:tarombo/core/theme/app_colors.dart';

class LineageHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;

  const LineageHeader({super.key, required this.title, required this.subtitle, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subtitle.toUpperCase(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2.0, color: AppColors.tertiary)),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: AppColors.primary, height: 1.1)),
          const SizedBox(height: 8),
          Text(description, style: const TextStyle(fontSize: 14, color: AppColors.onSurfaceVariant)),
        ],
      ),
    );
  }
}
