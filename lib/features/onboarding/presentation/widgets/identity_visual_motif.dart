import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tarombo/core/theme/app_colors.dart';
import 'package:tarombo/core/theme/app_typography.dart';

class IdentityVisualMotif extends StatelessWidget {
  const IdentityVisualMotif({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 192,
            width: double.infinity,
            color: AppColors.surfaceContainerLow,
            child: Stack(
              children: [
                ColorFiltered(
                  colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.saturation),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuCfz0o-sOnVZbqACTSVt9_mVcaluypSl1c7FlzS9KX34LtKZwMqRTWY5C1x01im_lw46jiLCXTayViCJF3OBmgxB8zgWtmpLQZOqPAMwexyHHgxGUmCmRW__bmfEUCg7krwYll4Z7BLc-oMGbA-wXJACe7wxKAJCtxbS8u5saKf07TAIdBkcSsJIZSiMrpQFMkTRAjM-jGUOeRClSnqOz78eIGpYY4eTUeT3vsd_Mz-q5We35WNjmi6Z98xDFwvncB7V2YLbogVe4GZ',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Container(color: Colors.black.withValues(alpha: 0.1)),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.diversity_3, color: Colors.white70, size: 40),
                      const SizedBox(height: 8),
                      Text('CONNECTING 1,000+ YEARS OF HISTORY', style: AppTypography.label.copyWith(fontSize: 10, color: Colors.white70, letterSpacing: 2)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 48),
        Text('KARYA ANAK BANGSA • TAROMBO DIGITAL ARCHIVE V1.0', style: AppTypography.label.copyWith(fontSize: 10, color: AppColors.secondary, letterSpacing: 2), textAlign: TextAlign.center),
      ],
    );
  }
}
