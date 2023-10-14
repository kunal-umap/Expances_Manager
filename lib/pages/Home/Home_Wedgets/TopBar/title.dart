import 'package:flutter/material.dart';

AppBar homeTopBar() {
  return AppBar(
    title: const Text(
      'Expanse Manager',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search),
      )
    ],
  );
}
