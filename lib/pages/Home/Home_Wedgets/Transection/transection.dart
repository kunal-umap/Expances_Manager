import 'dart:convert';
import 'package:expances_management/pages/Home/Home_Wedgets/GraphSection/Graph.dart';
import 'package:expances_management/pages/Home/Home_Wedgets/Transection/Main_page.dart';
import 'package:expances_management/pages/Transaction_Page/transactionPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Transection extends StatefulWidget {
  const Transection({
    super.key,
  });

  @override
  State<Transection> createState() => _TransectionState();
}

class _TransectionState extends State<Transection> {
  int selectedyear = DateTime.now().year;
  int selectedmonth = (DateTime.now().month);
  Future<Map<String, dynamic>> readJson() async {
    final response = await rootBundle.loadString('assects/data.json');
    final data = (jsonDecode(response));
    return data;
  }

  @override
  SafeArea build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Graph(),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 15, 0, 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Latest transaction",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 200,
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
                      if (index < 3) {
                        return Main_page(
                          label: data["$selectedyear"]["$selectedmonth"][index]
                              ["description"],
                          time: data["$selectedyear"]["$selectedmonth"][index]
                              ["date"],
                          icon: Icons.dinner_dining,
                          color: Colors.green,
                          price: data["$selectedyear"]["$selectedmonth"][index]
                              ["amount"],
                        );
                      }
                      return const SizedBox();
                    },
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 70,
              color: const Color.fromARGB(255, 24, 23, 23),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const TransactionPage();
                    }));
                  },
                  child: const Text(
                    "VIEW TRANSACTIONS",
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
      ),
    );
  }
}
