import 'dart:convert';
import 'package:expances_management/pages/Home/Home_Wedgets/Transection/Main_page.dart';
import 'package:expances_management/pages/Transaction_Page/transactionPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String? selectedmonth = selectedMonth.data;
int selectedyear = selectedYear;
Future<Map<String, dynamic>> readJson() async {
  final response = await rootBundle.loadString('assects/data.json');
  final data = (jsonDecode(response));
  print("$selectedyear");
  print("$selectedYear");
  return data;
}

// ignore: camel_case_types
class All extends StatefulWidget {
  const All({super.key});

  @override
  State<All> createState() => _Transaction_InfoState();
}

// ignore: camel_case_types
class _Transaction_InfoState extends State<All> {
  @override
  Widget build(BuildContext context) {
    print("$selectedyear");
    print("$selectedYear");
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
                    itemCount: data["$selectedyear"][selectedmonth].length,
                    itemBuilder: (context, index) {
                      return Main_page(
                          label: data["$selectedyear"][selectedmonth][index]
                              ["description"],
                          time: data["$selectedyear"][selectedmonth][index]
                              ["date"],
                          icon: Icons.dinner_dining,
                          color: Colors.green,
                          price: data["$selectedyear"][selectedmonth][index]
                              ["amount"]);
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
