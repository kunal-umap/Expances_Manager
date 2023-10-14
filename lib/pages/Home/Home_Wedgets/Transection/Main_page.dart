// ignore: file_names
import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class Main_page extends StatefulWidget {
  String label;
  String time;
  IconData icon;
  Color color;
  String price;
  Main_page({
    super.key,
    required this.label,
    required this.time,
    required this.icon,
    required this.color,
    required this.price,
  });

  @override
  State<Main_page> createState() => _Main_pageState();
}

// ignore: camel_case_types
class _Main_pageState extends State<Main_page> {
  @override
  Padding build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: Icon(
              widget.icon,
              color: widget.color,
              size: 30,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                widget.time,
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            widget.price,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
