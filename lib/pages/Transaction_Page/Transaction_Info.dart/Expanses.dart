import 'package:expances_management/pages/Home/Home_Wedgets/Transection/Main_page.dart';
import 'package:expances_management/pages/Transaction_Page/Transaction_Info.dart/all.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Expanse extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String Selectedyear;
  // ignore: non_constant_identifier_names
  String Selectedmonth;
  Expanse({
    super.key,
    // ignore: non_constant_identifier_names
    required this.Selectedyear,
    // ignore: non_constant_identifier_names
    required this.Selectedmonth,
  });

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
                  return const SizedBox();
                } else {
                  final data = snapshot.data!;
                  if (data[widget.Selectedyear] == null) {
                    return const SizedBox();
                  } else if (data[widget.Selectedyear][widget.Selectedmonth] ==
                      null) {
                    return const SizedBox();
                  }
                  return ListView.builder(
                    itemCount:
                        data[widget.Selectedyear][widget.Selectedmonth].length,
                    itemBuilder: (context, index) {
                      var Category = data[widget.Selectedyear]
                          [widget.Selectedmonth][index]["category"];
                      IconData icon = Icons.shopping_cart_outlined;
                      Color color = Colors.green;
                      switch (Category) {
                        case "Eat":
                          icon = Icons.food_bank_outlined;
                          color = Colors.blue;
                          break;
                        case "Bill":
                          icon = Icons.blinds_closed;
                          color = Colors.red;
                          break;
                        case "Emi":
                          icon = Icons.account_balance_wallet_outlined;
                          color = Colors.amber;
                          break;
                        case "Education":
                          icon = Icons.cast_for_education;
                          color = Colors.purple;
                          break;
                        case "Gadget":
                          icon = Icons.add_sharp;
                          color = Colors.white;
                          break;
                      }
                      if (data[widget.Selectedyear][widget.Selectedmonth][index]
                              ["type"] ==
                          "Expenses") {
                        return Main_page(
                          label: data[widget.Selectedyear][widget.Selectedmonth]
                              [index]["description"],
                          time: data[widget.Selectedyear][widget.Selectedmonth]
                              [index]["date"],
                          icon: icon,
                          color: color,
                          price: data[widget.Selectedyear][widget.Selectedmonth]
                              [index]["amount"],
                          color1: data[widget.Selectedyear]
                                      [widget.Selectedmonth][index]["type"] ==
                                  "Expenses"
                              ? const Color.fromARGB(255, 255, 17, 0)
                              : Colors.green,
                        );
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
