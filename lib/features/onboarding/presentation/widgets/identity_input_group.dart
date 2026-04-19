import 'package:flutter/material.dart';
import 'package:tarombo/core/theme/app_colors.dart';
import 'package:tarombo/core/theme/app_typography.dart';

class IdentityInputGroup extends StatelessWidget {
  final String label;
  final String hint;
  final String subtext;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Widget? trailing;

  const IdentityInputGroup({
    super.key,
    required this.label,
    required this.hint,
    required this.subtext,
    required this.icon,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
          child: Text(label.toUpperCase(), style: AppTypography.label.copyWith(fontSize: 11, color: AppColors.onSurfaceVariant, letterSpacing: 1.5, fontWeight: FontWeight.bold)),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(color: AppColors.surfaceContainerHigh, borderRadius: BorderRadius.circular(16)),
          child: Row(
            children: [
              Icon(icon, color: AppColors.secondary),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  style: AppTypography.headline.copyWith(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.onSurface),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: AppTypography.headline.copyWith(fontSize: 16, color: AppColors.onSurfaceVariant.withValues(alpha: 0.5)),
                  ),
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 8.0), child: Text(subtext, style: AppTypography.body.copyWith(fontSize: 12, color: AppColors.secondary, fontStyle: FontStyle.italic))),
      ],
    );
  }
}
