// ignore: file_names
import 'package:expances_management/pages/Transaction_Page/transactionPage.dart';
import 'package:flutter/material.dart';

class ViewTransaction extends StatelessWidget {
  const ViewTransaction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const TransactionPage();
                  },
                ),
              );
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
    );
  }
}
