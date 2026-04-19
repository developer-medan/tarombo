import 'package:equatable/equatable.dart';
import 'package:tarombo/features/lineage/domain/entities/lineage_node.dart';

enum LineageStatus { initial, loading, success, failure }

class LineageState extends Equatable {
  final LineageStatus status;
  final LineageNode? rootNode;
  final String? errorMessage;

  const LineageState({this.status = LineageStatus.initial, this.rootNode, this.errorMessage});

  LineageState copyWith({LineageStatus? status, LineageNode? rootNode, String? errorMessage}) {
    return LineageState(status: status ?? this.status, rootNode: rootNode ?? this.rootNode, errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [status, rootNode, errorMessage];
}
