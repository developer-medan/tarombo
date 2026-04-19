import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tarombo/core/theme/app_colors.dart';
import 'package:tarombo/core/routes/routes.dart';
import 'package:tarombo/core/routes/route_names.dart';

void main() {
  runApp(const TaromboApp());
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
    _router = GoRouter(initialLocation: RouteNames.root, routes: AppRoutes.routes);
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
