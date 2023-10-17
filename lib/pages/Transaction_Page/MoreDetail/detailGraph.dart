import 'package:expances_management/Pages/Transaction_Page/MoreDetail/MoreDetailWidget/PiChart.dart';
import 'package:flutter/material.dart';


class DetailGraph extends StatelessWidget {
  const DetailGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Expenses"),
      ),
      body: const Center(
        child: PieChartKu(),
      ),
    );
  }
}
