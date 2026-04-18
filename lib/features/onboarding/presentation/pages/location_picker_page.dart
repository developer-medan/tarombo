import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tarombo/core/theme/app_colors.dart';
import 'package:tarombo/core/theme/app_typography.dart';

class LocationPickerPage extends StatefulWidget {
  const LocationPickerPage({super.key});

  @override
  State<LocationPickerPage> createState() => _LocationPickerPageState();
}

class _LocationPickerPageState extends State<LocationPickerPage> {
  final TextEditingController _searchController = TextEditingController();
  LatLng? _selectedLocation;
  String? _selectedLocationName;
  
  // Initial camera position around Lake Toba
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(2.5855, 98.8188),
    zoom: 10,
  );

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onMapTapped(LatLng position) {
    setState(() {
      _selectedLocation = position;
      // In a real implementation via Geocoding, reverse geocode to get name
      _selectedLocationName = "Custom Location (${position.latitude.toStringAsFixed(2)}, ${position.longitude.toStringAsFixed(2)})";
      _searchController.text = _selectedLocationName!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: AppColors.primary,
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Pick Origin Location',
          style: AppTypography.headline.copyWith(
            color: AppColors.primaryContainer,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.surfaceContainerHigh,
                hintText: 'Search or tap on map...',
                prefixIcon: const Icon(Icons.search, color: AppColors.primary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (val) {
                _selectedLocationName = val;
              },
            ),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: _initialPosition,
              onTap: _onMapTapped,
              markers: _selectedLocation != null 
                  ? {
                      Marker(
                        markerId: const MarkerId('selected'),
                        position: _selectedLocation!,
                      )
                    } 
                  : {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.onPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (_selectedLocationName?.isNotEmpty == true) {
                    // Pass the location data back
                    context.pop(_selectedLocationName);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select a location')),
                    );
                  }
                },
                child: Text('CONFIRM LOCATION', style: AppTypography.label),
              ),
            ),
          )
        ],
      ),
    );
  }
}
