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

  final _categoryItem = [
    (" Eat"),
    ("Bill"),
    ("Education"),
    ("EMI"),
    ("Gadget")
  ];

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
                                var _modeItemSelected =
                                    newModeSelected as String;
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
                                  var _categorySelected =
                                      newCategorySelected as String;
                                });
                              }))
                    ],
                  )),
              const SizedBox(height: 30),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Date",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(
                            width: 140,
                            height: 35,
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide:
                                      const BorderSide(color: Colors.green),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide:
                                      const BorderSide(color: Colors.green),
                                ),
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.calendar_month),
                                  iconSize: 15,
                                ),
                              ),
                              cursorHeight: 15,
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "in rs",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                            width: 140,
                            height: 35,
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide:
                                      const BorderSide(color: Colors.green),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide:
                                      const BorderSide(color: Colors.green),
                                ),
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.currency_rupee),
                                  iconSize: 15,
                                ),
                              ),
                              cursorHeight: 15,
                            ))
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
