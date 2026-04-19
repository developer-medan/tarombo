import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarombo/core/theme/app_colors.dart';
import 'package:tarombo/core/theme/app_typography.dart';
import 'package:tarombo/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:tarombo/features/onboarding/presentation/bloc/onboarding_state.dart';

class IdentitySubmitButton extends StatelessWidget {
  final VoidCallback onPressed;

  const IdentitySubmitButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        final isLoading = state is OnboardingLoading;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(colors: [AppColors.primary, AppColors.primaryContainer], begin: Alignment.topLeft, end: Alignment.bottomRight),
            boxShadow: [BoxShadow(color: AppColors.onSurfaceVariant.withValues(alpha: 0.2), blurRadius: 32, offset: const Offset(0, 12))],
          ),
          child: ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            child:
                isLoading
                    ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('ESTABLISH LINEAGE', style: AppTypography.headline.copyWith(color: Colors.white, fontSize: 16)),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
          ),
        );
      },
    );
  }
}
