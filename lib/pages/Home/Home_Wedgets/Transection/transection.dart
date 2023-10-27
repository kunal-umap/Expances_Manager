import 'dart:convert';
import 'dart:io';
import 'package:expances_management/file_oprations.dart';
import 'package:expances_management/pages/Home/Home_Wedgets/GraphSection/Graph.dart';
import 'package:expances_management/pages/Home/Home_Wedgets/Transection/Main_page.dart';
import 'package:expances_management/pages/Transaction_Page/transactionPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class Transection extends StatefulWidget {
  const Transection({
    super.key,
  });

  @override
  State<Transection> createState() => _TransectionState();
}

class _TransectionState extends State<Transection> {
  int selectedyear = DateTime.now().year;
  int selectedmonth = (DateTime.now().month);
  String jsonString = '';
  Map<String, dynamic> _json = {};
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$kFileName');
  }

  Future<Map<String, dynamic>> readJson() async {
    // Initialize _filePath
    File filePath = await _localFile;

    // 0. Check whether the _file exists
    // print('0. File exists? ${await filePath.exists()}');

    // If the _file exists->read it: update initialized _json by what's in the _file
    if (await filePath.exists()) {
      try {
        //1. Read _jsonString<String> from the _file.
        jsonString = await filePath.readAsString();
        // print('1.(_readJson) _jsonString: $jsonString');

        //2. Update initialized _json by converting _jsonString<String>->_json<Map>
        _json = jsonDecode(jsonString);
        // print('2.(_readJson) _json: $_json \n - \n');
        return _json;
      } catch (e) {
        // Print exception errors
        // print('Tried reading _file error: $e');
        // If encountering an error, return null
        return {'e': e};
      }
    }
    return {"data": null};
  }

  @override
  SafeArea build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Graph(),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 15, 0, 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Latest transaction",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: FutureBuilder(
              future: readJson(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  final data = snapshot.data!;
                  while (data["$selectedyear"]["$selectedmonth"] == null) {
                    if (selectedmonth != 1) {
                      selectedmonth--;
                    } else {
                      selectedyear--;
                    }
                  }
                  return ListView.builder(
                    itemCount: data["$selectedyear"]["$selectedmonth"].length,
                    itemBuilder: (context, index) {
                      if (index < 3) {
                        var Category = data["$selectedyear"]["$selectedmonth"]
                            [index]["category"];
                        IconData icon = Icons.shopping_cart_outlined;
                        ["category"];
                        Color color = Colors.green;
                        ["category"];
                        switch (Category) {
                          case "Eat":
                            icon = Icons.food_bank_outlined;
                            color = Colors.blue;
                            break;
                          case "Bill":
                            icon = Icons.blinds_closed;
                            color = Colors.red;
                            break;
                          case "Emi":
                            icon = Icons.account_balance_wallet_outlined;
                            color = Colors.amber;
                            break;
                          case "Education":
                            icon = Icons.cast_for_education;
                            color = Colors.purple;
                            break;
                          case "Gadget":
                            icon = Icons.add_sharp;
                            color = Colors.white;
                            break;
                        }
                        return Main_page(
                          label: data["$selectedyear"]["$selectedmonth"][index]
                              ["category"],
                          time: data["$selectedyear"]["$selectedmonth"][index]
                              ["date"],
                          icon: icon,
                          color: color,
                          price: data["$selectedyear"]["$selectedmonth"][index]
                              ["amount"],
                          color1: data["$selectedyear"]["$selectedmonth"][index]
                                      ["type"] ==
                                  "EXPENSE"
                              ? const Color.fromARGB(255, 255, 17, 0)
                              : Colors.green,
                        );
                      }
                      return const SizedBox();
                    },
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 70,
              color: const Color.fromARGB(255, 24, 23, 23),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const TransactionPage();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "VIEW TRANSACTIONS",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 160, 25, 184),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
