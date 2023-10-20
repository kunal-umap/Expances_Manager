import 'package:expances_management/pages/Home/Home_Wedgets/Transection/Main_page.dart';
import 'package:expances_management/pages/Transaction_Page/Transaction_Info.dart/all.dart';
import 'package:flutter/material.dart';

class Expanse extends StatefulWidget {
  const Expanse({super.key});

  @override
  State<Expanse> createState() => _Transaction_InfoState();
}

// ignore: camel_case_types
class _Transaction_InfoState extends State<Expanse> {
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
                    itemCount: data["$selectedyear"]["$selectedmonth"].length,
                    itemBuilder: (context, index) {
                      if (data["$selectedyear"]["$selectedmonth"][index]
                              ["type"] ==
                          "Expenses") {
                        return Main_page(
                            label: data["$selectedyear"]["$selectedmonth"]
                                [index]["description"],
                            time: data["$selectedyear"]["$selectedmonth"][index]
                                ["date"],
                            icon: Icons.dinner_dining,
                            color: Colors.green,
                            price: data["$selectedyear"]["$selectedmonth"]
                                [index]["amount"]);
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
