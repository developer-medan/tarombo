import 'package:flutter/material.dart';
import 'package:tarombo/core/theme/app_colors.dart';
import 'package:tarombo/features/lineage/domain/entities/lineage_node.dart';

class LineageCard extends StatelessWidget {
  final LineageNode node;

  const LineageCard({super.key, required this.node});

  @override
  Widget build(BuildContext context) {
    final isPatriarchal = node.type == LineageType.patriarchal;
    final accentColor = isPatriarchal ? const Color(0xFF004A77) : AppColors.error;

    return Container(
      width: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10, offset: const Offset(0, 4))],
        border: Border(left: BorderSide(color: accentColor, width: 4)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(color: AppColors.secondaryContainer, shape: BoxShape.circle),
            child: const Icon(Icons.person_outline, color: AppColors.onSecondaryContainer),
          ),
          const SizedBox(height: 12),
          if (node.role != null && node.role != 'Boru')
            Text(node.role!.toUpperCase(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: -0.5, color: AppColors.onSurfaceVariant)),
          const SizedBox(height: 4),
          Text(node.name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.onSurface, height: 1.2)),
          if (node.relation != null) Padding(padding: const EdgeInsets.only(top: 4), child: Text(node.relation!, style: const TextStyle(fontSize: 10, color: AppColors.onSurfaceVariant))),
          if (node.years != null) Padding(padding: const EdgeInsets.only(top: 8), child: Text(node.years!, style: const TextStyle(fontSize: 10, color: AppColors.onSurfaceVariant))),
          if (node.role == 'Boru')
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(color: AppColors.error.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                child: const Text('BORU', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: AppColors.error)),
              ),
            ),
        ],
      ),
    );
  }
}
