import 'package:expances_management/pages/Home/Home_Wedgets/BottomBar/bottom.dart';
import 'package:expances_management/pages/Home/Home_Wedgets/TopBar/title.dart';
import 'package:expances_management/pages/Home/Home_Wedgets/TopBar/topbar_menu.dart';
import 'package:expances_management/pages/Home/Home_Wedgets/Transection/transection.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: homeTopBar(),
        drawer: topBarMenu(),
        bottomNavigationBar: bottomAppBar(),
        body: const Column(
          children: [Transection()],
        ),
      ),
    );
  }
}

/*
----------------------------
* Main Size
* App Title 32
* hedings 22
* Sub Text 16
* lowest 12
*---------------------------
* font : normal : Alegreya
*font : Heading : Rubik
*--------------------------
App Bar theam
colour : Black
Font Size : 32
* */
