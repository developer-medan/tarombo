import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarombo/core/routes/route_names.dart';
import 'package:tarombo/core/theme/app_colors.dart';
import 'package:tarombo/core/theme/app_typography.dart';
import 'package:tarombo/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:tarombo/features/splash/presentation/bloc/splash_state.dart';
import 'package:tarombo/features/splash/presentation/widgets/splash_logo_widget.dart';
import 'package:tarombo/features/splash/presentation/widgets/splash_backdrop.dart';
import 'package:tarombo/features/splash/presentation/widgets/splash_footer.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  void _onSplashStateChanged(BuildContext context, SplashState state) {
    if (state is SplashNavigateToNext) {
      context.go(RouteNames.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: _onSplashStateChanged,
      child: Scaffold(
        backgroundColor: AppColors.surface,
        body: Stack(
          children: [
            const SplashBackdrop(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const SizedBox(height: 16), _buildMainContent(), const SplashFooter()]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SplashLogoWidget(),
          const SizedBox(height: 16),
          Text('TAROMBO TOBA', style: AppTypography.headline.copyWith(fontSize: 48, color: AppColors.primaryContainer, height: 1.1), textAlign: TextAlign.center),
          const SizedBox(height: 16),
          Text('Menelusuri Akar, Menjaga Warisan', style: AppTypography.body.copyWith(fontSize: 18, color: AppColors.onSurfaceVariant), textAlign: TextAlign.center),
          const SizedBox(height: 16),
          Container(width: 48, height: 2, decoration: BoxDecoration(color: AppColors.primary.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(16))),
          const SizedBox(height: 16),
          Text('TRACING ROOTS, PRESERVING HERITAGE', style: AppTypography.label.copyWith(fontSize: 10, color: AppColors.tertiary, letterSpacing: 2.0), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
