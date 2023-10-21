import 'package:expances_management/Pages/Transaction_Page/MoreDetail/MoreDetailWidget/PiChart.dart';
import 'package:flutter/material.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:intl/intl.dart';
class DetailGraph extends StatefulWidget {
  const DetailGraph({super.key});

  @override
  State<DetailGraph> createState() => _DetailGraphState();
}
pri() {
  int selectedYear = DateTime.now().year;
  int selectedMonth = DateTime.now().month;
  print(selectedMonth.toString());
  print(selectedYear.toString());
}

class _DetailGraphState extends State<DetailGraph> {
  DateTime? _selected;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Expenses"),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: PieChartKu(),
            ),
            if (_selected == null)
              const Text('No month year selected.')
            else
              Text(DateFormat().add_yM().format(_selected!)),
              TextButton(
                child: const Text('DEFAULT LOCALE'),
                onPressed: () => _onPressed(context: context),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            pri();
            print(_selected);
          }
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
      lastDate: DateTime(2030),
      locale: localeObj,
    );
    // final selected = await showDatePicker(
    //   context: context,
    //   initialDate: _selected ?? DateTime.now(),
    //   firstDate: DateTime(2019),
    //   lastDate: DateTime(2022),
    //   locale: localeObj,
    // );
    if (selected != null) {
      setState(() {
        _selected = selected;
      });
    }
  }
}

