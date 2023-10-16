import 'package:flutter/material.dart';

class Bottom_bar extends StatefulWidget {
  const Bottom_bar({super.key});

  @override
  State<Bottom_bar> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Bottom_bar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      ]),
    );
  }
}
