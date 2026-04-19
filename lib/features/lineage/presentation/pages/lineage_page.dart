import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarombo/features/lineage/presentation/bloc/lineage_bloc.dart';
import 'package:tarombo/features/lineage/presentation/bloc/lineage_event.dart';
import 'package:tarombo/features/lineage/presentation/widgets/lineage_view.dart';

class LineagePage extends StatelessWidget {
  const LineagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LineageBloc()..add(const LineageFetched()), child: const LineageView());
  }
}
