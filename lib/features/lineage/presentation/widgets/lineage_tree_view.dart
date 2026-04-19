import 'package:flutter/material.dart';
import 'package:tarombo/features/lineage/domain/entities/lineage_node.dart';
import 'package:tarombo/features/lineage/presentation/widgets/lineage_card.dart';
import 'package:tarombo/features/lineage/presentation/widgets/sundut_marker.dart';
import 'package:tarombo/features/lineage/presentation/widgets/vertical_connector.dart';
import 'package:tarombo/features/lineage/presentation/widgets/horizontal_connector.dart';

class LineageTreeView extends StatelessWidget {
  final LineageNode rootNode;

  const LineageTreeView({super.key, required this.rootNode});

  @override
  Widget build(BuildContext context) {
    return Column(children: [_buildGeneration(rootNode)]);
  }

  Widget _buildGeneration(LineageNode node) {
    return Column(
      children: [
        SundutMarker(generation: node.generation),
        const SizedBox(height: 8),
        LineageCard(node: node),
        if (node.children.isNotEmpty) ...[const VerticalConnector(height: 64), _buildChildren(node.children)],
      ],
    );
  }

  Widget _buildChildren(List<LineageNode> children) {
    if (children.isEmpty) return const SizedBox.shrink();

    if (children.length == 1) {
      return _buildGeneration(children.first);
    }

    return Column(
      children: [
        HorizontalConnector(widthFactor: children.length > 2 ? 0.8 : 0.6),
        const SizedBox(height: 0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                children.asMap().entries.map((entry) {
                  final child = entry.value;
                  return Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Column(children: [const VerticalConnector(height: 32), _buildGeneration(child)]));
                }).toList(),
          ),
        ),
      ],
    );
  }
}
