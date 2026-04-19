import 'package:flutter/material.dart';
import 'package:tarombo/core/theme/app_colors.dart';

class LineageAppBar extends StatelessWidget {
  const LineageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.surface.withValues(alpha: 0.8),
      elevation: 0,
      centerTitle: false,
      leading: IconButton(icon: const Icon(Icons.menu, color: AppColors.primaryContainer), onPressed: () {}),
      title: const Text('TAROMBO', style: TextStyle(color: AppColors.primaryContainer, fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 2.0)),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CircleAvatar(
            radius: 16,
            backgroundImage: const NetworkImage(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuCAWjllEmvplNino9OfdGTZ0-1bo3DiQPlhBrIK89n0dWcuFav39yOzcBtcwLzHa822mPtMYRMmNZhJDtJwMrHKUt9DMtVxv1FquHpyOWvOmAggHtf0xlGRpAupJGDLSRgNY2Xz_l-P_xzM3gi8UBaWa-kTNB2OXFTaXN4vIHJI3KuZjAn1spzc1esdTdDBQanp9vQDrUpz7aArrKuFCT5zoDuMfBa2pPmgDiV7JM4EpMAoUEEt5ii7o1zMtdPTMC3dB8WR3T1GVcHM',
            ),
            onBackgroundImageError: (_, __) {},
            child: const Icon(Icons.person, size: 20),
          ),
        ),
      ],
    );
  }
}
