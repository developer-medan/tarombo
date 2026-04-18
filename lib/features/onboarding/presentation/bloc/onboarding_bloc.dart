import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
    on<SubmitIdentityEvent>(_onSubmitIdentityEvent);
  }

  Future<void> _onSubmitIdentityEvent(
    SubmitIdentityEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    // Basic validation
    if (event.marga.isEmpty || event.sundut.isEmpty || event.huta.isEmpty) {
      emit(const OnboardingError('Please complete all fields'));
      return;
    }

    emit(OnboardingLoading());
    
    // Simulate UseCase API call
    await Future.delayed(const Duration(seconds: 2));

    emit(OnboardingSuccess());
  }
}
