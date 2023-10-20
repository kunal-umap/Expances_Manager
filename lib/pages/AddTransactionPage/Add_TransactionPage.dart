// ignore: file_names
import 'package:expances_management/pages/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class add_Transaction extends StatefulWidget {
  const add_Transaction({super.key});

  @override
  State<add_Transaction> createState() => _add_TransactionState();
}

// ignore: camel_case_types
class _add_TransactionState extends State<add_Transaction> {
  late var _listItem = [
    "EXPENSE",
    "INCOME",
  ];
  var listItemSelected = "EXPENSES";
  var modechoose = " ";
  var modeItem = ["Online", "Cash"];

  final _categoryItem = [
    (" Eat"),
    ("Bill"),
    ("Education"),
    ("EMI"),
    ("Gadget")
  ];
  TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Transaction",
          style: TextStyle(color: Color.fromARGB(255, 160, 25, 184)),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Home(),
            ));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 160, 25, 184),
            size: 25,
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Type",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(width: 75),
                  SizedBox(
                    width: 250,
                    child: DropdownButton<String>(
                        hint: const Text("Select Type"),
                        isExpanded: true,
                        items: _listItem.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (newValueSelected) {
                          setState(() {
                            listItemSelected = newValueSelected!;
                          });
                        }),
                  )
                ],
              )),
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 16, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Mode",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(width: 70),
                  SizedBox(
                    width: 250,
                    child: DropdownButton<String>(
                        hint: const Text("Select Mode"),
                        isExpanded: true,
                        items: modeItem.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (newModeSelected) {
                          setState(() {});
                        }),
                  )
                ],
              )),
          const SizedBox(height: 30),
          const Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 16, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Discription",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(width: 25),
                  SizedBox(width: 250, height: 20, child: TextField()),
                ],
              )),
          const SizedBox(height: 35),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 16, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Category",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(width: 40),
                  SizedBox(
                    width: 250,
                    child: DropdownButton<String>(
                        dropdownColor: Colors.black,
                        isExpanded: true,
                        hint: const Text("Select Category"),
                        items: _categoryItem.map((dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (newValueSelected) {
                          setState(() {
                            _listItem = newValueSelected as List<String>;
                          });
                        }),
                  )
                ],
              )),
          const SizedBox(height: 10),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 95, bottom: 5),
                      child: Text(
                        "Date",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                        width: 140,
                        height: 35,
                        child: TextField(
                          keyboardType: TextInputType.none,
                          style: const TextStyle(fontSize: 20),
                          controller: _date,
                          decoration: const InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(right: 16),
                              child: Icon(
                                Icons.calendar_month_outlined,
                              ),
                            ),
                          ),
                          onTap: () async {
                            DateTime? datapicked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2002),
                                lastDate: DateTime(2030));
                            if (datapicked != null) {
                              setState(() {
                                _date.text =
                                    DateFormat("yyyy-MM-dd").format(datapicked);
                              });
                            }
                          },
                        ))
                  ],
                ),
              ),
              const VerticalDivider(
                color: Colors.green,
                thickness: 1,
                indent: 40,
                endIndent: 100,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(50, 5, 16, 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 23),
                      child: SizedBox(
                          width: 140,
                          height: 35,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.currency_rupee_rounded,
                                ),
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 327,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Add",
                style: TextStyle(
                    color: Color.fromARGB(255, 160, 25, 184), fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
