import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarombo/features/lineage/domain/entities/lineage_node.dart';
import 'package:tarombo/features/lineage/presentation/bloc/lineage_event.dart';
import 'package:tarombo/features/lineage/presentation/bloc/lineage_state.dart';

class LineageBloc extends Bloc<LineageEvent, LineageState> {
  LineageBloc() : super(const LineageState()) {
    on<LineageFetched>(_onLineageFetched);
  }

  void _onLineageFetched(LineageFetched event, Emitter<LineageState> emit) {
    emit(state.copyWith(status: LineageStatus.loading));

    // Mocking data based on the design
    final rootNode = LineageNode(
      id: '1',
      name: 'Ompu Palti Raja',
      years: '1845 — 1912',
      role: 'Patriarch',
      generation: 14,
      children: [
        LineageNode(id: '2', name: 'Raja Ishak', relation: 'First Son', generation: 15, children: [LineageNode(id: '4', name: 'Gr. Manahan', role: 'Direct Descendant', generation: 16)]),
        LineageNode(id: '3', name: 'Boru Ni Raja', relation: 'First Daughter', role: 'Boru', type: LineageType.matriarchal, generation: 15),
        LineageNode(id: '5', name: 'Raja Musa', relation: 'Second Son', generation: 15, children: [LineageNode(id: '6', name: 'St. Daulat', role: 'Living Heir', generation: 16)]),
      ],
    );

    emit(state.copyWith(status: LineageStatus.success, rootNode: rootNode));
  }
}
