// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//void main() {
//runApp(
//MaterialApp(
//debugShowCheckedModeBanner: false,
//theme: ThemeData.dark(useMaterial3: true),
//home: const TransactionPage(),
//),
//);
//}

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TransactionPageState();
  }
}

class _TransactionPageState extends State<TransactionPage> {
  String showYear = 'Select Year';
  DateTime _selectedYear = DateTime.now();

  Text showMonth = const Text(
    'Select Month',
    style: TextStyle(fontSize: 16),
  );
  Text _selectedMonth = Text(
    "${DateTime.now().month}",
    style: const TextStyle(fontSize: 16),
  );
  final list = [
    const Text(
      'jan',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      'feb',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      'mar',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      'april',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      'may',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      'june',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      'july',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      'aug',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      'sep',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      'oct',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      'nov',
      style: TextStyle(fontSize: 16),
    ),
    const Text(
      'dec',
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
                            _selectedMonth = list.elementAt(index);
                            showMonth = _selectedMonth;
                          });
                        },
                        children: list),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (showMonth.data == 'Select Month') {
                          setState(() {
                            _selectedMonth = list.elementAt(0);
                            showMonth = _selectedMonth;
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
          title: const Text('Select Year'),
          content: SizedBox(
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 10, 1),
              lastDate: DateTime.now(),
              initialDate: DateTime.now(),
              selectedDate: _selectedYear,
              onChanged: (DateTime dateTime) {
                print(dateTime.year);
                setState(
                  () {
                    _selectedYear = dateTime;
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true)
          .copyWith(appBarTheme: AppBarTheme(color: Colors.black45)),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_back)),
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
          body: const TabBarView(children: [
            Center(
                child: Text(
              "One",
              style: TextStyle(fontSize: 50),
            )),
            Center(
                child: Text(
              "Two",
              style: TextStyle(fontSize: 50),
            )),
            Center(
                child: Text(
              "Three",
              style: TextStyle(fontSize: 50),
            ))
          ]),
        ),
      ),
    );
  }
}
