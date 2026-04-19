import 'package:flutter/material.dart';
import 'package:tarombo/core/theme/app_colors.dart';

class LocationSearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const LocationSearchField({super.key, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.surfaceContainerHigh,
          hintText: 'Search or tap on map...',
          prefixIcon: const Icon(Icons.search, color: AppColors.primary),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
