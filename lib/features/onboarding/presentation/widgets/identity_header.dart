import 'package:flutter/material.dart';
import 'package:tarombo/core/theme/app_colors.dart';
import 'package:tarombo/core/theme/app_typography.dart';

class IdentityHeader extends StatelessWidget {
  const IdentityHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(alignment: Alignment.centerLeft, child: Text('Identity Setup', style: AppTypography.headline.copyWith(fontSize: 44, color: AppColors.primary, height: 1.1))),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Define your placement in the ancestral ledger of the Toba people.', style: AppTypography.body.copyWith(fontSize: 18, color: AppColors.onSurfaceVariant)),
        ),
      ],
    );
  }
}
