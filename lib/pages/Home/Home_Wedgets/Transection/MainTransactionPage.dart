import 'package:expances_management/pages/Home/Home_Wedgets/Transection/Main_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainTransactionPage extends StatelessWidget {
  MainTransactionPage({
    super.key,
    required this.data,
    required this.selectedyear,
    required this.selectedmonth,
  });

  // ignore: prefer_typing_uninitialized_variables
  var data;
  final int selectedyear;
  final int selectedmonth;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data["$selectedyear"]["$selectedmonth"].length,
      itemBuilder: (context, index) {
        if (index < 3) {
          // ignore: non_constant_identifier_names
          var Category =
              data["$selectedyear"]["$selectedmonth"][index]["category"];
          IconData icon = Icons.shopping_cart_outlined;
          ["category"];
          Color color = Colors.green;
          ["category"];
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
          return Main_page(
            label: data["$selectedyear"]["$selectedmonth"][index]["category"],
            time: data["$selectedyear"]["$selectedmonth"][index]["date"],
            icon: icon,
            color: color,
            price: data["$selectedyear"]["$selectedmonth"][index]["amount"],
            color1: data["$selectedyear"]["$selectedmonth"][index]["type"] ==
                    "EXPENSE"
                ? const Color.fromARGB(255, 255, 17, 0)
                : Colors.green,
          );
        }
      },
    );
  }
}
