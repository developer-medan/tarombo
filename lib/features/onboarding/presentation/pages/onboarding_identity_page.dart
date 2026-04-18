import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tarombo/core/theme/app_colors.dart';
import 'package:tarombo/core/theme/app_typography.dart';
import 'package:tarombo/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:tarombo/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:tarombo/features/onboarding/presentation/bloc/onboarding_state.dart';

class OnboardingIdentityPage extends StatefulWidget {
  const OnboardingIdentityPage({super.key});

  @override
  State<OnboardingIdentityPage> createState() => _OnboardingIdentityPageState();
}

class _OnboardingIdentityPageState extends State<OnboardingIdentityPage> {
  final TextEditingController _margaController = TextEditingController();
  final TextEditingController _sundutController = TextEditingController();
  final ValueNotifier<String?> _selectedHuta = ValueNotifier<String?>(null);

  @override
  void dispose() {
    _margaController.dispose();
    _sundutController.dispose();
    _selectedHuta.dispose();
    super.dispose();
  }

  void _onBlocListener(BuildContext context, OnboardingState state) {
    if (state is OnboardingSuccess) {
      context.go('/home');
    } else if (state is OnboardingError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  void _submit() {
    context.read<OnboardingBloc>().add(SubmitIdentityEvent(
          marga: _margaController.text.trim(),
          sundut: _sundutController.text.trim(),
          huta: _selectedHuta.value ?? '',
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingBloc, OnboardingState>(
      listener: _onBlocListener,
      child: Scaffold(
        backgroundColor: AppColors.surface,
        appBar: AppBar(
          backgroundColor: Colors.white.withValues(alpha: 0.8),
          elevation: 0,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          title: Row(
            children: [
              const Icon(Icons.account_tree, color: AppColors.primary, size: 20),
              const SizedBox(width: 12),
              Text(
                'TAROMBO TOBA',
                style: AppTypography.headline.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: AppColors.primary,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon(Icons.search, color: AppColors.secondary),
                onPressed: () {},
                style: IconButton.styleFrom(
                  hoverColor: Colors.black12,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            // Ambient SVG background motif
            Positioned.fill(
              child: Opacity(
                opacity: 0.1,
                child: SvgPicture.string(
                  '''<svg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'><path d='M30 0c16.568 0 30 13.432 30 30S46.568 60 30 60 0 46.568 0 30 13.432 0 30 0zm0 4c-14.36 0-26 11.64-26 26s11.64 26 26 26 26-11.64 26-26S44.36 4 30 4zm0 6c11.046 0 20 8.954 20 20s-8.954 20-20 20-20-8.954-20-20 8.954-20 20-20zm0 4c-8.837 0-16 7.163-16 16s7.163 16 16 16 16-7.163 16-16-7.163-16-16-16z' fill='#570000' fill-opacity='0.03' fill-rule='evenodd'/></svg>''',
                  fit: BoxFit.scaleDown,
                  // Tiling unsupported without wrapper, scaleDown works well for a minimalist central emblem
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Hero
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Identity Setup',
                      style: AppTypography.headline.copyWith(
                        fontSize: 44,
                        color: AppColors.primary,
                        height: 1.1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Define your placement in the ancestral ledger of the Toba people.',
                      style: AppTypography.body.copyWith(
                        fontSize: 18,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Form
                  _buildInputGroup(
                    label: 'Marga (Clan Name)',
                    hint: 'e.g. Hutagalung, Napitupulu',
                    subtext: 'Your patrilineal clan identifier.',
                    icon: Icons.groups,
                    controller: _margaController,
                  ),
                  const SizedBox(height: 24),

                  _buildInputGroup(
                    label: 'Sundut (Generation)',
                    hint: '15',
                    subtext: "Numbered from your clan's founding patriarch.",
                    icon: Icons.stairs,
                    controller: _sundutController,
                    keyboardType: TextInputType.number,
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.tertiaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'SUNDUT',
                        style: AppTypography.label.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.onTertiaryContainer,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Selection Card
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(16),
                      border: const Border(left: BorderSide(color: AppColors.primary, width: 4)),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Huta Origin', style: AppTypography.headline.copyWith(fontSize: 16)),
                            const Icon(Icons.location_on, color: AppColors.primary),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ValueListenableBuilder<String?>(
                          valueListenable: _selectedHuta,
                          builder: (context, value, _) {
                            return Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                _buildHutaOption('Balige', value == 'Balige'),
                                _buildHutaOption('Tarutung', value == 'Tarutung'),
                                _buildHutaOption('Samosir', value == 'Samosir'),
                                _buildHutaOptionOther(
                                    value != null && !['Balige', 'Tarutung', 'Samosir'].contains(value) ? value : 'Other'),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

              // Action Button
              BlocBuilder<OnboardingBloc, OnboardingState>(
                builder: (context, state) {
                  final isLoading = state is OnboardingLoading;
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.primaryContainer],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.onSurfaceVariant.withValues(alpha: 0.2),
                          blurRadius: 32,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ESTABLISH LINEAGE',
                                  style: AppTypography.headline.copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward, color: Colors.white),
                              ],
                            ),
                    ),
                  );
                },
              ),

                  const SizedBox(height: 48),

                  // Visual Motif
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
                                Text(
                                  'CONNECTING 1,000+ YEARS OF HISTORY',
                                  style: AppTypography.label.copyWith(
                                    fontSize: 10,
                                    color: Colors.white70,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Text(
                    'KARYA ANAK BANGSA • TAROMBO DIGITAL ARCHIVE V1.0',
                    style: AppTypography.label.copyWith(
                      fontSize: 10,
                      color: AppColors.secondary,
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHutaOption(String name, bool isSelected) {
    return InkWell(
      onTap: () => _selectedHuta.value = name,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          name,
          style: AppTypography.body.copyWith(
            color: isSelected ? AppColors.onPrimary : AppColors.onSurface,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildHutaOptionOther(String name) {
    final bool isSelected = !['Balige', 'Tarutung', 'Samosir', 'Other'].contains(name);
    return InkWell(
      onTap: () async {
        final result = await context.push<String>('/onboarding/location');
        if (result != null) {
          _selectedHuta.value = result;
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: isSelected ? null : Border.all(color: AppColors.onSurfaceVariant, style: BorderStyle.solid),
        ),
        child: Text(
          isSelected ? name : 'Other',
          style: AppTypography.body.copyWith(
            color: isSelected ? AppColors.onPrimary : AppColors.onSurfaceVariant,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildInputGroup({
    required String label,
    required String hint,
    required String subtext,
    required IconData icon,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    Widget? trailing,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
          child: Text(
            label.toUpperCase(),
            style: AppTypography.label.copyWith(
              fontSize: 11,
              color: AppColors.onSurfaceVariant,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(icon, color: AppColors.secondary),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  style: AppTypography.headline.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurface,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: AppTypography.headline.copyWith(
                      fontSize: 16,
                      color: AppColors.onSurfaceVariant.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              if (trailing != null) trailing,
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            subtext,
            style: AppTypography.body.copyWith(
              fontSize: 12,
              color: AppColors.secondary,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}
