import 'package:expances_management/Pages/Home/Home_Wedgets/GraphSection/Graph_Chart.dart';
import 'package:expances_management/Pages/Transaction_Page/MoreDetail/detailGraph.dart';
import 'package:expances_management/file_oprations.dart';
import 'package:flutter/material.dart';

class Graph extends StatelessWidget {
  Graph({super.key});
  var year = DateTime.now().year;
  var mon = DateTime.now().month;
  final month = [
    "January", "February", "March", "April",
    "May", "June", "July", "August", "September",
    "October", "November", "December"
  ];

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(12, 2, 10, 2),
                        child: Text(
                          "Expenses",
                          style: TextStyle(
                            fontSize: 22,
                            color: Color.fromRGBO(233, 225, 225, .8)
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                        child: Text(
                          '${month[mon -1]}-$year',
                          style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(233, 225, 225, .8)
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 2, 12, 2),
                    child:  FutureBuilder(
                      future: FileOprations().getVal(year, mon),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return const Text(
                              'Err',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w600 ,
                                color: Color.fromARGB(255, 160, 25, 184)
                              ),
                          );
                        } else {
                          final data = snapshot.data;
                          return Text(
                            '₹ $data',
                            style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w600 ,
                                color: Color.fromARGB(255, 160, 25, 184)
                            ),
                          );
                        }
                      }
                    ),
                  )
                ],
              ),
            ),
            ConstrainedBox(
              constraints:const BoxConstraints(
                maxHeight: 250
              ),
                child: const LineChartGraph()
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 56,
                color: const Color.fromARGB(255, 24, 23, 23),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 12, 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const DetailGraph();
                      }));
                    },
                    child: const Text(
                      "VIEW DETAILS",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 160, 25, 184),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        )
    );
  }
}
