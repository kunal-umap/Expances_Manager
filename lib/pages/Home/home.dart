// ignore_for_file: camel_case_types
import 'package:expances_management/pages/Home/Home_Wedgets/TopBar/title.dart';
import 'package:expances_management/pages/Home/Home_Wedgets/TopBar/topbar_menu.dart';
import 'package:expances_management/pages/Home/Home_Wedgets/Transection/transection.dart';
import 'package:expances_management/pages/TransactionPage/Add_TransactionPage.dart';
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
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          onTap: (index) {
            setState(() {
              currentPage = index;
            });
          },
          currentIndex: currentPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.request_page),
              label: "Transaction",
            ),
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
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
    );
  }
}
