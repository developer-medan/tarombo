import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tarombo/core/routes/route_names.dart';
import 'package:tarombo/core/theme/app_colors.dart';
import 'package:tarombo/core/theme/app_typography.dart';

class IdentityHutaSelection extends StatelessWidget {
  final ValueNotifier<String?> selectedHuta;

  const IdentityHutaSelection({super.key, required this.selectedHuta});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(16), border: const Border(left: BorderSide(color: AppColors.primary, width: 4))),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Huta Origin', style: AppTypography.headline.copyWith(fontSize: 16)), const Icon(Icons.location_on, color: AppColors.primary)],
          ),
          const SizedBox(height: 16),
          ValueListenableBuilder<String?>(
            valueListenable: selectedHuta,
            builder: (context, value, _) {
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildHutaOption(context, 'Balige', value == 'Balige'),
                  _buildHutaOption(context, 'Tarutung', value == 'Tarutung'),
                  _buildHutaOption(context, 'Samosir', value == 'Samosir'),
                  _buildHutaOptionOther(context, value != null && !['Balige', 'Tarutung', 'Samosir'].contains(value) ? value : 'Other'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHutaOption(BuildContext context, String name, bool isSelected) {
    return InkWell(
      onTap: () => selectedHuta.value = name,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(color: isSelected ? AppColors.primary : AppColors.surfaceVariant, borderRadius: BorderRadius.circular(8)),
        child: Text(name, style: AppTypography.body.copyWith(color: isSelected ? AppColors.onPrimary : AppColors.onSurface, fontSize: 14)),
      ),
    );
  }

  Widget _buildHutaOptionOther(BuildContext context, String name) {
    final bool isSelected = !['Balige', 'Tarutung', 'Samosir', 'Other'].contains(name);
    return InkWell(
      onTap: () async {
        final result = await context.push<String>(RouteNames.onboardingLocation);
        if (result != null) {
          selectedHuta.value = result;
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: isSelected ? null : Border.all(color: AppColors.onSurfaceVariant, style: BorderStyle.solid),
        ),
        child: Text(isSelected ? name : 'Other', style: AppTypography.body.copyWith(color: isSelected ? AppColors.onPrimary : AppColors.onSurfaceVariant, fontSize: 14)),
      ),
    );
  }
}
