import 'package:equatable/equatable.dart';

abstract class LineageEvent extends Equatable {
  const LineageEvent();

  @override
  List<Object?> get props => [];
}

class LineageFetched extends LineageEvent {
  const LineageFetched();
}
