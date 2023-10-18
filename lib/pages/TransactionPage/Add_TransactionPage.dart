import 'package:expances_management/pages/Home/home.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class add_Transaction extends StatefulWidget {
  const add_Transaction({super.key});

  @override
  State<add_Transaction> createState() => _add_TransactionState();
}

// ignore: camel_case_types
class _add_TransactionState extends State<add_Transaction> {
  var _listItem = [
    "EXPENSE",
    "INCOME",
  ];
  var listItemSelected = "EXPENSES";
  var modechoose = " ";
  var modeItem = ["Online", "Cash"];
  var _modeItemSelected = "Online";

  final _categoryItem = [
    (" Eat"),
    ("Bill"),
    ("Education"),
    ("EMI"),
    ("Gadget")
  ];
  var _categorySelected = ("Eat");

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
              Icons.arrow_left,
              color: Color.fromARGB(255, 160, 25, 184),
              size: 40,
            ),
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 16, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Type",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(width: 80),
                      SizedBox(
                        width: 250,
                        child: DropdownButton<String>(
                            hint: const Text("Select Type"),
                            isExpanded: true,
                            dropdownColor: Colors.black,
                            elevation: 5,
                            items: _listItem.map((String dropDownStringItem) {
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
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 16, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Mode",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(width: 70),
                      SizedBox(
                        width: 250,
                        child: DropdownButton<String>(
                            dropdownColor: Colors.black,
                            isExpanded: true,
                            hint: const Text("Select Mode"),
                            items: modeItem.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(dropDownStringItem),
                              );
                            }).toList(),
                            onChanged: (newModeSelected) {
                              setState(() {
                                _modeItemSelected = newModeSelected as String;
                              });
                            }),
                      )
                    ],
                  )),
              const SizedBox(height: 20),
              const Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 16, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Discription",
                        style: TextStyle(fontSize: 20, color: Colors.white),
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
                        style: TextStyle(fontSize: 20, color: Colors.white),
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
                              onChanged: (newCategorySelected) {
                                setState(() {
                                  _categorySelected =
                                      newCategorySelected as String;
                                });
                              }))
                    ],
                  )),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 16, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.date_range,
                          color: Color.fromARGB(255, 187, 38, 162),
                        ),
                        tooltip: "Date",
                      ),
                    ],
                  )),
              const SizedBox(width: 60),
              SizedBox(
                height: 50,
                child: BottomAppBar(
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Add",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
