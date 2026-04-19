import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tarombo/core/theme/app_colors.dart';
import 'package:tarombo/core/theme/app_typography.dart';
import 'package:tarombo/features/onboarding/presentation/widgets/location_search_field.dart';
import 'package:tarombo/features/onboarding/presentation/widgets/location_confirm_button.dart';

class LocationPickerPage extends StatefulWidget {
  const LocationPickerPage({super.key});

  @override
  State<LocationPickerPage> createState() => _LocationPickerPageState();
}

class _LocationPickerPageState extends State<LocationPickerPage> {
  final TextEditingController _searchController = TextEditingController();
  LatLng? _selectedLocation;
  String? _selectedLocationName;

  static const CameraPosition _initialPosition = CameraPosition(target: LatLng(2.5855, 98.8188), zoom: 10);

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onMapTapped(LatLng position) {
    setState(() {
      _selectedLocation = position;
      _selectedLocationName = "Custom Location (${position.latitude.toStringAsFixed(2)}, ${position.longitude.toStringAsFixed(2)})";
      _searchController.text = _selectedLocationName!;
    });
  }

  void _onConfirm() {
    if (_selectedLocationName?.isNotEmpty == true) {
      context.pop(_selectedLocationName);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select a location')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: AppColors.primary, onPressed: () => context.pop()),
        title: Text('Pick Origin Location', style: AppTypography.headline.copyWith(color: AppColors.primaryContainer, fontSize: 20)),
      ),
      body: Column(
        children: [
          LocationSearchField(
            controller: _searchController,
            onChanged: (val) {
              _selectedLocationName = val;
            },
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: _initialPosition,
              onTap: _onMapTapped,
              markers: _selectedLocation != null ? {Marker(markerId: const MarkerId('selected'), position: _selectedLocation!)} : {},
            ),
          ),
          LocationConfirmButton(onPressed: _onConfirm),
        ],
      ),
    );
  }
}
