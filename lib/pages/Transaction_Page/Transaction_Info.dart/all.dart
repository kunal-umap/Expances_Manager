import 'dart:convert';
import 'package:expances_management/pages/Home/Home_Wedgets/Transection/Main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

int selectedmonth = DateTime.now().month;
//int selectedyear = selectedYear;
Future<Map<String, dynamic>> readJson() async {
  final response = await rootBundle.loadString('assects/data.json');
  final data = (jsonDecode(response));
  return data;
}

// ignore: camel_case_types, must_be_immutable
class All extends StatefulWidget {
  String selectedyear;
  String Selectedmonth;

  All({
    super.key,
    required this.selectedyear,
    required this.Selectedmonth,
  });

  @override
  State<All> createState() => _Transaction_InfoState();
}

// ignore: camel_case_types
class _Transaction_InfoState extends State<All> {
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
                        data[widget.selectedyear][widget.Selectedmonth].length,
                    itemBuilder: (context, index) {
                      return Main_page(
                          label: data[widget.selectedyear][widget.Selectedmonth]
                              [index]["description"],
                          time: data[widget.selectedyear][widget.Selectedmonth]
                              [index]["date"],
                          icon: Icons.dinner_dining,
                          color: Colors.green,
                          price: data[widget.selectedyear][widget.Selectedmonth]
                              [index]["amount"]);
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
