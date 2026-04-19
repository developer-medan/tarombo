import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tarombo/core/theme/app_colors.dart';
import 'package:tarombo/core/theme/app_typography.dart';

class IdentityAppBar extends StatelessWidget implements PreferredSizeWidget {
  const IdentityAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white.withValues(alpha: 0.8),
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      flexibleSpace: ClipRect(child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), child: Container(color: Colors.transparent))),
      title: Row(
        children: [
          const Icon(Icons.account_tree, color: AppColors.primary, size: 20),
          const SizedBox(width: 12),
          Text('TAROMBO TOBA', style: AppTypography.headline.copyWith(fontSize: 14, fontWeight: FontWeight.w900, color: AppColors.primary, letterSpacing: 2)),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(icon: const Icon(Icons.search, color: AppColors.secondary), onPressed: () {}, style: IconButton.styleFrom(hoverColor: Colors.black12)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
