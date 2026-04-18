import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashInitialized>(_onSplashInitialized);
  }

  Future<void> _onSplashInitialized(
    SplashInitialized event,
    Emitter<SplashState> emit,
  ) async {
    // Artificial delay to show the splash screen
    // Later, this can be replaced with a UseCase call to load settings or check auth status
    await Future.delayed(const Duration(seconds: 3));
    emit(SplashNavigateToNext());
  }
}
