import 'package:equatable/equatable.dart';

enum LineageType { patriarchal, matriarchal }

class LineageNode extends Equatable {
  final String id;
  final String name;
  final String? years;
  final String? role; // e.g., "Patriarch", "Direct Descendant", etc.
  final String? relation; // e.g., "First Son", "First Daughter"
  final LineageType type;
  final int generation; // sundut
  final List<LineageNode> children;

  const LineageNode({required this.id, required this.name, this.years, this.role, this.relation, this.type = LineageType.patriarchal, required this.generation, this.children = const []});

  @override
  List<Object?> get props => [id, name, years, role, relation, type, generation, children];
}
