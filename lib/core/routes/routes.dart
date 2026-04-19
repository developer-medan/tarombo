import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tarombo/core/routes/route_names.dart';
import 'package:tarombo/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:tarombo/features/onboarding/presentation/pages/location_picker_page.dart';
import 'package:tarombo/features/onboarding/presentation/pages/onboarding_identity_page.dart';
import 'package:tarombo/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:tarombo/features/splash/presentation/bloc/splash_event.dart';
import 'package:tarombo/features/splash/presentation/pages/splash_page.dart';
import 'package:tarombo/features/lineage/presentation/pages/lineage_page.dart';

class AppRoutes {
  static final List<RouteBase> routes = [
    GoRoute(path: RouteNames.root, builder: (context, state) => BlocProvider(create: (context) => SplashBloc()..add(const SplashInitialized()), child: const SplashPage())),
    GoRoute(path: RouteNames.onboarding, builder: (context, state) => BlocProvider(create: (context) => OnboardingBloc(), child: const OnboardingIdentityPage())),
    GoRoute(path: RouteNames.onboardingLocation, builder: (context, state) => const LocationPickerPage()),
    GoRoute(path: RouteNames.lineage, builder: (context, state) => const LineagePage()),
  ];
}
