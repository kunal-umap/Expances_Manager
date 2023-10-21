import 'package:expances_management/pages/Home/Home_Wedgets/Transection/Main_page.dart';
import 'package:expances_management/pages/Transaction_Page/Transaction_Info.dart/all.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Income extends StatefulWidget {
  String Selectedyear;
  String Selectedmonth;
  Income({
    super.key,
    required this.Selectedyear,
    required this.Selectedmonth,
  });

  @override
  State<Income> createState() => _Transaction_InfoState();
}

// ignore: camel_case_types
class _Transaction_InfoState extends State<Income> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: readJson(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  final data = snapshot.data!;
                  return ListView.builder(
                    itemCount:
                        data[widget.Selectedyear][widget.Selectedmonth].length,
                    itemBuilder: (context, index) {
                      if (data[widget.Selectedyear][widget.Selectedmonth][index]
                              ["type"] ==
                          "Income") {
                        return Main_page(
                            label: data[widget.Selectedyear]
                                [widget.Selectedmonth][index]["description"],
                            time: data[widget.Selectedyear]
                                [widget.Selectedmonth][index]["date"],
                            icon: Icons.dinner_dining,
                            color: Colors.green,
                            price: data[widget.Selectedyear]
                                [widget.Selectedmonth][index]["amount"]);
                      }
                      return const SizedBox();
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}