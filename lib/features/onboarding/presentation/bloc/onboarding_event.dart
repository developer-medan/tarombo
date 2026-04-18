import 'package:equatable/equatable.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

class SubmitIdentityEvent extends OnboardingEvent {
  final String marga;
  final String sundut;
  final String huta;

  const SubmitIdentityEvent({
    required this.marga,
    required this.sundut,
    required this.huta,
  });

  @override
  List<Object?> get props => [marga, sundut, huta];
}
