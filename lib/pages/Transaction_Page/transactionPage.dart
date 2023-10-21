// ignore_for_file: file_names;
import 'package:expances_management/pages/Transaction_Page/Transaction_Info.dart/Expanses.dart';
import 'package:expances_management/pages/Transaction_Page/Transaction_Info.dart/Income.dart';
import 'package:expances_management/pages/Transaction_Page/Transaction_Info.dart/all.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _TransactionPageState();
  }
}

class _TransactionPageState extends State<TransactionPage>
    with TickerProviderStateMixin {
  String showYear = 'SY';
  int selectedYear = DateTime.now().year;
  Text selectedMonth = Text(
    "${DateTime.now().month}",
    style: const TextStyle(fontSize: 16),
  );

  Text showMonth = const Text(
    'Select Month',
    style: TextStyle(fontSize: 16),
  );
  final list = [
    const Text(
      '1',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      '2',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      '3',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      '4',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      '5',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      '6',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      '7',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      '8',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      '9',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      '10',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      '11',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      '12',
      style: TextStyle(fontSize: 16),
    ),
  ];
  selectMonth(context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Select Month'),
            content: SizedBox(
              width: 300,
              height: 300,
              child: Column(
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: CupertinoPicker(
                        itemExtent: 40,
                        onSelectedItemChanged: (index) {
                          setState(() {
                            selectedMonth = list.elementAt(index);
                            showMonth = selectedMonth;
                          });
                        },
                        children: list),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (showMonth.data == 'Select Month') {
                          setState(() {
                            selectedMonth = list.elementAt(0);
                            showMonth = selectedMonth;
                          });
                        }
                        Navigator.pop(context);
                      },
                      child: const Text('Select')),
                ],
              ),
            ),
          );
        });
  }

  selectYear(context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('SY'),
          content: SizedBox(
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 10, 1),
              lastDate: DateTime.now(),
              initialDate: DateTime.now(),
              selectedDate: DateTime(selectedYear),
              onChanged: (DateTime dateTime) {
                setState(
                  () {
                    selectedYear = dateTime.year;
                    showYear = "${dateTime.year}";
                  },
                );
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        selectYear(context);
                      },
                      icon: const Icon(Icons.calendar_month)),
                  Text(
                    showYear,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        selectMonth(context);
                      },
                      icon: const Icon(Icons.calendar_month)),
                  showMonth,
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
          bottom: const TabBar(
              indicatorColor: Colors.white38,
              dividerColor: Colors.white24,
              labelColor: Colors.white60,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(
                  text: 'ALL',
                ),
                Tab(
                  text: 'EXPANCES',
                ),
                Tab(
                  text: 'INCOME',
                )
              ]),
        ),
        body: TabBarView(
          children: [
            All(
              selectedyear: selectedYear.toString(),
              Selectedmonth: selectedMonth.data.toString(),
            ),
            Expanse(
              Selectedyear: selectedYear.toString(),
              Selectedmonth: selectedMonth.data.toString(),
            ),
            Income(
              Selectedyear: selectedYear.toString(),
              Selectedmonth: selectedMonth.data.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
