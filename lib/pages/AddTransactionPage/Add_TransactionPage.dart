// ignore: file_names
import 'package:expances_management/file_oprations.dart';
import 'package:expances_management/pages/Home/home.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

// ignore: camel_case_types
class add_Transaction extends StatefulWidget {
  const add_Transaction({super.key});

  @override
  State<add_Transaction> createState() => _add_TransactionState();
}

// ignore: camel_case_types
class _add_TransactionState extends State<add_Transaction> {
  final DiscriptionController = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final Paise = TextEditingController();
  late final _listItem = [
    "EXPENSE",
    "INCOME",
  ];

  var listItemSelected;

  var modechoose;
  var categorychooe;
  var modeItem = ["Online", "Cash"];

  final _categoryItem = [
    (" Eat"),
    ("Bill"),
    ("Education"),
    ("EMI"),
    ("Gadget")
  ];

  @override
  void dispose() {
    DiscriptionController.dispose();
    Paise.dispose();
    super.dispose();
  }
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Type",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(width: 75),
                Expanded(
                  // width: 150,
                  child: DropdownButton<String>(
                      hint: const Text("Select type"),
                      value: listItemSelected,
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
            ),
          ),
          const SizedBox(height: 2),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Mode",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(width: 70),
                  Expanded(
                    child: DropdownButton<String>(
                        hint: const Text("Select Mode"),
                        value: modechoose,
                        isExpanded: true,
                        items: modeItem.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (newModeSelected) {
                          setState(() {
                            modechoose = newModeSelected!;
                          });
                        }),
                  )
                ],
              )),
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 3,
                    child: Text(
                      "Discription",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  // SizedBox(width: 25),
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      height: 18,
                        child: TextField(
                          controller: DiscriptionController,
                        )
                    ),
                  ),
                ],
              )),
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Category",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    child: DropdownButton<String>(
                        dropdownColor: Colors.black,
                        isExpanded: true,
                        hint: const Text("Select Category"),
                        value: categorychooe,
                        items: _categoryItem.map((dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (newValueSelected) {
                          setState(() {
                            categorychooe = newValueSelected!;
                          });
                        }),
                  )
                ],
              )
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 20, 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Date",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                          ),
                        ),
                        SizedBox(
                            width: 150,
                            height: 40,
                            child: TextField(
                              keyboardType: TextInputType.none,
                              style: const TextStyle(fontSize: 16),
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
                            )
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 28),
                          child: SizedBox(
                              height: 35,
                              child: TextField(
                                controller: Paise,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(fontSize: 20),
                                decoration: const InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(right: 12),
                                    child: Icon(
                                      Icons.currency_rupee_rounded,
                                    ),
                                  ),
                                ),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          SizedBox(
            height: 50,
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () async {
                var dataNew = {
                  "description": DiscriptionController.text,
                  "mode": modechoose,
                  "category": categorychooe,
                  "date": _date.text,
                  "amount": Paise.text,
                  "type": listItemSelected
                };
                DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(_date.text);
                  await FileOprations().writeJsonByData('${tempDate.year}','${tempDate.month}',dataNew);
                  print( await FileOprations().readJson());
              },
              child: const Text(
                "Add",
                style: TextStyle(
                    color: Color.fromARGB(255, 160, 25, 184),
                    fontSize: 18
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
