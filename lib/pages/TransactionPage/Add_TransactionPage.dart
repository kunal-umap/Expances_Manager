// ignore: file_names
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
  final _listItem = [
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
              Icons.arrow_left,
              color: Color.fromARGB(255, 160, 25, 184),
              size: 40,
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
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(width: 80),
                    DropdownButton<String>(
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
                        })
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
                    DropdownButton<String>(
                        items: modeItem.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (newModeSelected) {
                          setState(() {});
                        })
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
                              setState(() {});
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
        ));
  }
}
