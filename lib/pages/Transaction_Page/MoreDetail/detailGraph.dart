import 'dart:convert';
import 'package:expances_management/Pages/Transaction_Page/MoreDetail/MoreDetailWidget/PiChart.dart';
import 'package:expances_management/file_oprations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:month_year_picker/month_year_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class DetailGraph extends StatefulWidget {
  const DetailGraph({super.key});
  @override
  State<DetailGraph> createState() => _DetailGraphState();
}

int selectedYear = DateTime.now().year;
int selectedMonth = DateTime.now().month;

Future<Map<String, dynamic>> readJson() async {
  final data = FileOprations().readJson();
  return data;
}

class _DetailGraphState extends State<DetailGraph> {
  DateTime? _selected = DateTime(selectedYear, selectedMonth);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Expenses"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TextButton(
                    child: const Icon(Icons.calendar_month),
                    onPressed: () => _onPressed(context: context),
                  ),
                  Text(
                    DateFormat().add_yM().format(_selected!),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder(
              future: readJson(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  final data = snapshot.data;
                  return PieChartKu(
                    data: data[DateFormat().add_y().format(_selected!)]
                        [DateFormat().add_M().format(_selected!)],
                  );
                }
              }),
        ),
      ),
    );
  }

  Future<void> _onPressed({
    required BuildContext context,
    String? locale,
  }) async {
    final localeObj = locale != null ? Locale(locale) : null;
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: _selected ?? DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(selectedYear, selectedMonth),
      locale: localeObj,
    );
    if (selected != null) {
      setState(() {
        _selected = selected;
      });
    }
  }
}
