import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tarombo/core/theme/app_colors.dart';
import 'package:tarombo/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:tarombo/features/splash/presentation/bloc/splash_event.dart';
import 'package:tarombo/features/splash/presentation/pages/splash_page.dart';

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
    _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => BlocProvider(
            create: (context) => SplashBloc()..add(const SplashInitialized()),
            child: const SplashPage(),
          ),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const Scaffold(
            body: Center(child: Text('Home Page')),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tarombo Toba',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          surface: AppColors.surface,
          primary: AppColors.primary,
        ),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
