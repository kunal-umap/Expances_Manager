import "package:flutter/material.dart";

BottomAppBar bottomAppBar() {
  return const BottomAppBar(
    color: Colors.black,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(children: [
          SizedBox(height: 2),
          Icon(Icons.home, size: 30),
          Text(
            "Home",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2)
        ]),
        Column(children: [
          SizedBox(height: 2),
          Icon(
            Icons.money,
            size: 30,
            shadows: [],
          ),
          Text(
            "Transaction",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2),
        ]),
        Column(children: [
          SizedBox(height: 2),
          Icon(Icons.cloud, size: 30),
          Text(
            "Dummy",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2),
        ])
      ],
    ),
  );
}
