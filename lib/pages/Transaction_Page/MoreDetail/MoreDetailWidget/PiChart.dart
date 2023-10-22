import 'package:expances_management/pages/Transaction_Page/MoreDetail/MoreDetailWidget/dataname.dart';
import 'package:fl_chart/fl_chart.dart';
import 'indicator.dart';
import 'package:flutter/material.dart';

class PieChartKu extends StatefulWidget {
  final data;
  PieChartKu({
    super.key,
    required this.data,
  });
  @override
  State<StatefulWidget> createState() => PieChartKuState();
}

class PieChartKuState extends State<PieChartKu> {
  int heig = 1;
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 12, 22, 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: double.parse((35*heig).toString()),
                    width: 200,
                    child: DataName(
                        data: widget.data
                    ),
                  ),
                  // Indicator(
                  //   color: Colors.blue,
                  //   text: 'First',
                  //   isSquare: true,
                  // ),
                  // SizedBox(
                  //   height: 4,
                  // ),
                  // Indicator(
                  //   color: Colors.amber,
                  //   text: 'Second',
                  //   isSquare: true,
                  // ),
                  // SizedBox(
                  //   height: 4,
                  // ),
                  // Indicator(
                  //   color: Colors.deepPurple,
                  //   text: 'Third',
                  //   isSquare: true,
                  // ),
                  // SizedBox(
                  //   height: 4,
                  // ),
                  // Indicator(
                  //   color: Colors.green,
                  //   text: 'Fourth',
                  //   isSquare: true,
                  // ),
                  // SizedBox(
                  //   height: 18,
                  // ),
                ],
              ),
            ),
          ],
        ),
        AspectRatio(
          aspectRatio: 1.15,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 3,
              centerSpaceRadius: 45,
              sections: showingSections(widget.data),
            ),
          ),
        ),
<<<<<<< HEAD

=======
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 22, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DataName(data: widget.data),
                  // const Indicator(
                  //   color: Colors.blue,
                  //   text: 'First',
                  //   isSquare: true,
                  // ),
                  // const SizedBox(
                  //   height: 4,
                  // ),
                  // const Indicator(
                  //   color: Colors.amber,
                  //   text: 'Second',
                  //   isSquare: true,
                  // ),
                  // const SizedBox(
                  //   height: 4,
                  // ),
                  // const Indicator(
                  //   color: Colors.deepPurple,
                  //   text: 'Third',
                  //   isSquare: true,
                  // ),
                  // const SizedBox(
                  //   height: 4,
                  // ),
                  // const Indicator(
                  //   color: Colors.green,
                  //   text: 'Fourth',
                  //   isSquare: true,
                  // ),
                  // const SizedBox(
                  //   height: 18,
                  // ),
                ],
              ),
            ),
          ],
        ),
>>>>>>> 02ce06fadd37b44ddced30cd85e57e33568360bf
      ],
    );
  }

  List<PieChartSectionData> showingSections(data) {
    final category = {};
    int total = 0;
    List name = [];
    for (int i = 0; i < data.length; i++) {
      if (category[data[i]['category']] != null) {
        category[data[i]['category']] += int.parse(data[i]['amount']);
      } else {
        name.add(data[i]['category']);
        category[data[i]['category']] = int.parse(data[i]['amount']);
      }
      total += int.parse(data[i]['amount']);
    }
<<<<<<< HEAD
    heig = name.length;
    List col = [Colors.greenAccent,Colors.blueAccent,Colors.pinkAccent,Colors.purpleAccent];
=======
    List col = [
      Colors.greenAccent,
      Colors.blueAccent,
      Colors.pinkAccent,
      Colors.purpleAccent
    ];
>>>>>>> 02ce06fadd37b44ddced30cd85e57e33568360bf

    return List.generate(category.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 22.0 : 14.0;
      final radius = isTouched ? 88.0 : 78.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 1.2)];
      double val = double.parse(category[name[i]].toString());
      return PieChartSectionData(
        color: col[i],
        value: val,
        title: '${(val * 100 / total).round()}%',
        titlePositionPercentageOffset: 0.80,
        badgeWidget: Text(
          name[i],
          style: const TextStyle(fontSize: 12, color: Colors.white70),
        ),
        badgePositionPercentageOffset: 1.32,
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: shadows,
        ),
      );
    });
  }
}
