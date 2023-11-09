// ignore: file_names
import 'package:expances_management/file_oprations.dart';
import 'package:expances_management/pages/Home/home.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore: camel_case_types
class add_Transaction extends StatefulWidget {
  const add_Transaction({super.key});

  @override
  State<add_Transaction> createState() => _add_TransactionState();
}

// ignore: camel_case_types
class _add_TransactionState extends State<add_Transaction> {
  final discriptionController = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final paise = TextEditingController();
  late final _listItem = [
    "EXPENSE",
    "INCOME",
  ];

  // ignore: prefer_typing_uninitialized_variables
  var listItemSelected;

  // ignore: prefer_typing_uninitialized_variables
  var modechoose;
  // ignore: prefer_typing_uninitialized_variables
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
    discriptionController.dispose();
    paise.dispose();
    super.dispose();
  }

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // const SizedBox(height: 20),
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
            // const SizedBox(height: 2),
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
            // const SizedBox(height: 10),
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
                            controller: discriptionController,
                          )),
                    ),
                  ],
                )),
            // const SizedBox(height: 10),
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
                )),
            // const SizedBox(height: 10),
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
                                      _date.text = DateFormat("yyyy-MM-dd")
                                          .format(datapicked);
                                    });
                                  }
                                },
                              ))
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
                                  controller: paise,
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
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            SizedBox(
              height: 50,
              width: 100,
              child: ElevatedButton(
                onPressed: () async {
                  if(discriptionController.text == ''){
                  //   popup
                  //   _onBasicAllertPressed(context);
                    _onCustomAnimationAlertPressed(context);
                  }else
                  if(paise.text == '0' || paise.text == ''){
                  //   popup
                  //   _onBasicAllertPressed(context);
                    _onCustomAnimationAlertPressed(context);

                  }else
                  if(modechoose == null &&  listItemSelected == null ){
                  //   popup
                    _onCustomAnimationAlertPressed(context);
                  //   _onBasicAllertPressed(context);

                  }else
                  if(discriptionController.text != '' && modechoose != null && paise.text != null && paise.text != '0'&& listItemSelected != null && paise.text != '') {
                    DateTime tempDate;
                    if(_date.text != ''){
                      tempDate =
                      new DateFormat("yyyy-MM-dd").parse(_date.text);
                    }else {
                      tempDate = DateTime.now();
                    }
                    var dataNew = {
                      "description": discriptionController.text,
                      "mode": modechoose,
                      "category": categorychooe,
                      "date": _date.text,
                      "amount": paise.text,
                      "type": listItemSelected
                    };
                    await FileOprations().writeJsonByData(
                        '${tempDate.year}', '${tempDate.month}', dataNew);
                    // popup
                    _onBasicAllertPressed(context);

                    paise.text = "";
                    _date.text = "";
                    discriptionController.text = "";
                  }
                },
                child: const Text(
                  "Add",
                  style: TextStyle(
                      color: Color.fromARGB(255, 160, 25, 184), fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onBasicAllertPressed(context) {
    Alert(
      context: context,
      title: "Saved ✅",
      desc: "Transaction Added Sucessfully ✨"
    ).show();
  }

  _onCustomAnimationAlertPressed(context) {
    Alert(
      context: context,
      title: "All field necessary ⚠️",
      desc: "Please fill the all values below",
      alertAnimation: fadeAlertAnimation,
    ).show();
  }
  Widget fadeAlertAnimation(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return Align(
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }

}
