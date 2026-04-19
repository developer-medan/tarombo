import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tarombo/core/routes/route_names.dart';
import 'package:tarombo/core/theme/app_colors.dart';
import 'package:tarombo/core/theme/app_typography.dart';
import 'package:tarombo/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:tarombo/features/onboarding/presentation/bloc/onboarding_event.dart';
import 'package:tarombo/features/onboarding/presentation/bloc/onboarding_state.dart';
import 'package:tarombo/features/onboarding/presentation/widgets/identity_app_bar.dart';
import 'package:tarombo/features/onboarding/presentation/widgets/identity_background.dart';
import 'package:tarombo/features/onboarding/presentation/widgets/identity_header.dart';
import 'package:tarombo/features/onboarding/presentation/widgets/identity_input_group.dart';
import 'package:tarombo/features/onboarding/presentation/widgets/identity_huta_selection.dart';
import 'package:tarombo/features/onboarding/presentation/widgets/identity_submit_button.dart';
import 'package:tarombo/features/onboarding/presentation/widgets/identity_visual_motif.dart';

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
      context.go(RouteNames.lineage);
    } else if (state is OnboardingError) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message), backgroundColor: AppColors.error));
    }
  }

  void _submit() {
    context.read<OnboardingBloc>().add(SubmitIdentityEvent(marga: _margaController.text.trim(), sundut: _sundutController.text.trim(), huta: _selectedHuta.value ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingBloc, OnboardingState>(
      listener: _onBlocListener,
      child: Scaffold(
        backgroundColor: AppColors.surface,
        appBar: const IdentityAppBar(),
        body: Stack(
          children: [
            const IdentityBackground(),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const IdentityHeader(),
                  const SizedBox(height: 32),
                  IdentityInputGroup(label: 'Marga (Clan Name)', hint: 'e.g. Hutagalung, Napitupulu', subtext: 'Your patrilineal clan identifier.', icon: Icons.groups, controller: _margaController),
                  const SizedBox(height: 24),
                  IdentityInputGroup(
                    label: 'Sundut (Generation)',
                    hint: '15',
                    subtext: "Numbered from your clan's founding patriarch.",
                    icon: Icons.stairs,
                    controller: _sundutController,
                    keyboardType: TextInputType.number,
                    trailing: _buildSundutTrailing(),
                  ),
                  const SizedBox(height: 24),
                  IdentityHutaSelection(selectedHuta: _selectedHuta),
                  const SizedBox(height: 32),
                  IdentitySubmitButton(onPressed: _submit),
                  const SizedBox(height: 48),
                  const IdentityVisualMotif(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSundutTrailing() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: AppColors.tertiaryContainer, borderRadius: BorderRadius.circular(8)),
      child: Text('SUNDUT', style: AppTypography.label.copyWith(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.onTertiaryContainer)),
    );
  }
}
