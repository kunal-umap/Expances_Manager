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
      body:  const SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: PieChartKu(),
            ),
            Icon(
              Icons.accessibility
            ),

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
          backgroundColor: Colors.green,
          onPressed: () {},
          // isExtended: true,
          child: const Icon(Icons.add)
      ),
    );
  }
}
