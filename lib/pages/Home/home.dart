import 'package:expances_management/pages/Home/Home_Wedgets/BottomBar/bottom.dart';
import 'package:expances_management/pages/Home/Home_Wedgets/GraphSection/Graph.dart';
import 'package:expances_management/pages/Home/Home_Wedgets/TopBar/title.dart';
import 'package:expances_management/pages/Home/Home_Wedgets/TopBar/topbar_menu.dart';
import 'package:expances_management/pages/Home/Home_Wedgets/Transection/transection.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeTopBar(),
      drawer: topBarMenu(),
      bottomNavigationBar: const Bottom_bar(),
      body: const Column(children: [
        Graph(),
        Transection(),
      ]),
    );
  }
}
