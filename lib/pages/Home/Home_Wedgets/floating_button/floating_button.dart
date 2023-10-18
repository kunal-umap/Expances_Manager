import "package:flutter/material.dart";

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 160, 25, 184),
        child: const Icon(Icons.add),
      ),
    );
  }
}
