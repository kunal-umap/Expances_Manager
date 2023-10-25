// ignore_for_file: camel_case_types
import 'package:expances_management/pages/Home/Home_Wedgets/TopBar/title.dart';
import 'package:expances_management/pages/Home/Home_Wedgets/TopBar/topbar_menu.dart';
import 'package:expances_management/pages/Home/Home_Wedgets/Transection/transection.dart';
import 'package:expances_management/pages/AddTransactionPage/Add_TransactionPage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _bottom_barState();
}

class _bottom_barState extends State<Home> {
  int currentPage = 0;
  List<Widget> pages = const [Transection(), Transection()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeTopBar(),
      drawer: topBarMenu(),
      body: const SingleChildScrollView(child: Transection()),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: FloatingActionButton(
          foregroundColor: Colors.black,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const add_Transaction(),
              ),
            );
          },
          backgroundColor: const Color.fromARGB(255, 160, 25, 184),
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
