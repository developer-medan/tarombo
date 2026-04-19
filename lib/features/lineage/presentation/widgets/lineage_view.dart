import 'package:flutter/material.dart';
import 'package:tarombo/core/theme/app_colors.dart';
import 'package:tarombo/features/lineage/presentation/widgets/gorga_painter.dart';
import 'package:tarombo/features/lineage/presentation/widgets/lineage_app_bar.dart';
import 'package:tarombo/features/lineage/presentation/widgets/lineage_bottom_nav_bar.dart';
import 'package:tarombo/features/lineage/presentation/widgets/lineage_content.dart';
import 'package:tarombo/features/lineage/presentation/widgets/lineage_fab.dart';
import 'package:tarombo/features/lineage/presentation/widgets/lineage_header.dart';

class LineageView extends StatelessWidget {
  const LineageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Stack(
        children: [
          // Background pattern (Gorga-like)
          Positioned.fill(child: Opacity(opacity: 0.03, child: CustomPaint(painter: GorgaPainter()))),
          const CustomScrollView(
            slivers: [
              LineageAppBar(),
              SliverToBoxAdapter(
                child: LineageHeader(
                  title: 'Ompu Palti Raja',
                  subtitle: 'Dynamic Tree Viewer',
                  description: 'Visualizing the direct lineage of the 14th Generation. Navigate through generations using the vertical ledger.',
                ),
              ),
              LineageContent(),
              SliverPadding(padding: EdgeInsets.only(bottom: 120)),
            ],
          ),
          const Positioned(bottom: 100, right: 24, child: LineageFAB()),
          const Positioned(bottom: 0, left: 0, right: 0, child: LineageBottomNavBar()),
        ],
      ),
    );
  }
}
