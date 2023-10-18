import 'package:expances_management/pages/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class add_Transaction extends StatefulWidget {
  const add_Transaction({super.key});

  @override
  State<add_Transaction> createState() => _add_TransactionState();
}

class _add_TransactionState extends State<add_Transaction> {
  var valueChoos = " ";
  var listItem = [
    "EXPENSE",
    "INCOME",
    "TRANSFER",
    "ATM Withdeawal",
    "Cash Received",
    "CASHBACK"
        "REFUND"
  ];
  var listItemSelected = "EXPENSES";
  var modechoose = " ";
  var modeItem = ["Online", "Cash"];
  var modeItemSelected = "Online";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Add Transaction",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 187, 38, 162)),
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
              color: Color.fromARGB(255, 187, 38, 162),
              size: 30,
            ),
          ),
        ),
        body: Container(
          color: Colors.black,
          child: ListView(
            children: [
              SizedBox(height: 20),
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Type",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(width: 80),
                      DropdownButton<String>(
                          items: listItem.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem),
                            );
                          }).toList(),
                          onChanged: (newValueSelected) {
                            setState(() {
                              this.listItemSelected = newValueSelected!;
                            });
                          })
                    ],
                  )),
              const SizedBox(height: 40),
              Padding(
                  padding: const EdgeInsets.all(16.0),
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
                            setState(() {
                              this.modeItemSelected = newModeSelected!;
                            });
                          })
                    ],
                  )),
              const SizedBox(height: 40),
              const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Discription",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(width: 25),
                      SizedBox(width: 250, height: 20, child: TextField())
                    ],
                  )),
              const SizedBox(height: 40),
              const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(width: 40),
                      SizedBox(width: 250, height: 20, child: TextField())
                    ],
                  )),
              const SizedBox(height: 40),
              Padding(
                  padding: const EdgeInsets.all(16.0),
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
            ],
          ),
        ));
  }
}
