import 'package:flutter/material.dart';
import 'package:tarombo/core/theme/app_colors.dart';

class LineageFAB extends StatelessWidget {
  final VoidCallback? onPressed;

  const LineageFAB({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [AppColors.primary, AppColors.primaryContainer], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: AppColors.primary.withValues(alpha: 0.3), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: Material(color: Colors.transparent, child: InkWell(borderRadius: BorderRadius.circular(16), onTap: onPressed, child: const Icon(Icons.add, color: Colors.white, size: 32))),
    );
  }
}
