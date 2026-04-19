import 'package:flutter/material.dart';
import 'package:tarombo/core/theme/app_colors.dart';

class LineageBottomNavBar extends StatelessWidget {
  const LineageBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 32, top: 12),
      decoration: BoxDecoration(color: AppColors.surface.withOpacity(0.8), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, -5))]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.account_tree, 'Lineage', true),
          _buildNavItem(Icons.diversity_3, 'Tutur', false),
          _buildNavItem(Icons.search, 'Search', false),
          _buildNavItem(Icons.person, 'Profile', false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    if (isActive) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(gradient: const LinearGradient(colors: [AppColors.primary, AppColors.primaryContainer]), borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(height: 4),
            Text(label.toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
          ],
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [Icon(icon, color: Colors.grey, size: 20), const SizedBox(height: 4), Text(label.toUpperCase(), style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold))],
    );
  }
}
