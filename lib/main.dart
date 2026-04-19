import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tarombo/core/bloc/app_bloc_observer.dart';
import 'package:tarombo/core/theme/app_colors.dart';
import 'package:tarombo/core/routes/routes.dart';
import 'package:tarombo/core/routes/route_names.dart';
import 'package:tarombo/core/util/global_ui_handler.dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();

      // Initialize Bloc Observer
      Bloc.observer = AppBlocObserver();

      // Handle Flutter framework errors
      FlutterError.onError = (details) {
        FlutterError.presentError(details);
        // TODO: Send to crashlytics/logging service
      };

      runApp(const TaromboApp());
    },
    (error, stack) {
      // Handle async errors outside of Flutter framework
      debugPrint('Caught async error: $error');
      debugPrint('Stack trace: $stack');
      // TODO: Send to crashlytics/logging service
    },
  );
}

class TaromboApp extends StatefulWidget {
  const TaromboApp({super.key});

  @override
  State<TaromboApp> createState() => _TaromboAppState();
}

class _TaromboAppState extends State<TaromboApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = GoRouter(navigatorKey: GlobalUIHandler().navigatorKey, initialLocation: RouteNames.root, routes: AppRoutes.routes);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tarombo Toba',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary, surface: AppColors.surface, primary: AppColors.primary), useMaterial3: true),
      routerConfig: _router,
    );
  }
}
