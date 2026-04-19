import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarombo/features/lineage/presentation/bloc/lineage_bloc.dart';
import 'package:tarombo/features/lineage/presentation/bloc/lineage_state.dart';
import 'package:tarombo/features/lineage/presentation/widgets/lineage_tree_view.dart';

class LineageContent extends StatelessWidget {
  const LineageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LineageBloc, LineageState>(
      builder: (context, state) {
        if (state.status == LineageStatus.loading) {
          return const SliverFillRemaining(child: Center(child: CircularProgressIndicator()));
        }

        if (state.status == LineageStatus.success && state.rootNode != null) {
          return SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.symmetric(vertical: 40), child: LineageTreeView(rootNode: state.rootNode!)));
        }

        return const SliverFillRemaining(child: Center(child: Text('Failed to load lineage data')));
      },
    );
  }
}
