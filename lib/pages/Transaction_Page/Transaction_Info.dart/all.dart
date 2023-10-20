import 'dart:convert';
import 'package:expances_management/pages/Home/Home_Wedgets/Transection/Main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: camel_case_types
class Transaction_Info extends StatefulWidget {
  const Transaction_Info({super.key});

  @override
  State<Transaction_Info> createState() => _Transaction_InfoState();
}

// ignore: camel_case_types
class _Transaction_InfoState extends State<Transaction_Info> {
  int selectedyear = (DateTime.now().year);
  int selectedmonth = (DateTime.now().month);
  Future<Map<String, dynamic>> readJson() async {
    final response = await rootBundle.loadString('assects/data.json');
    final data = (jsonDecode(response));
    print(selectedmonth);
    return data;
  }

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
                    itemCount: data["2023"]["01"].length,
                    itemBuilder: (context, index) {
                      return Main_page(
                          label: data["2023"]["01"][index]["description"],
                          time: data["2023"]["01"][index]["date"],
                          icon: Icons.dinner_dining,
                          color: Colors.green,
                          price: data["2023"]["01"][index]["amount"]);
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
