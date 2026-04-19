import 'package:flutter/material.dart';
import 'package:tarombo/core/theme/app_colors.dart';
import 'package:tarombo/core/theme/app_typography.dart';

class SplashFooter extends StatelessWidget {
  const SplashFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 2))],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.auto_awesome, color: AppColors.primary, size: 16),
              const SizedBox(width: 8),
              Text('KARYA ANAK BANGSA', style: AppTypography.label.copyWith(fontSize: 10, color: AppColors.onSurfaceVariant, letterSpacing: 1.5, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Powered by ', style: AppTypography.body.copyWith(fontSize: 11, color: AppColors.onSurfaceVariant.withValues(alpha: 0.6))),
            Text('Marga Digital', style: AppTypography.headline.copyWith(fontSize: 12, color: AppColors.primaryContainer, fontStyle: FontStyle.italic)),
          ],
        ),
      ],
    );
  }
}
