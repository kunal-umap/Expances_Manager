import 'dart:convert';
import 'dart:io';
import 'package:expances_management/file_oprations.dart';
import 'package:expances_management/pages/Home/Home_Wedgets/Transection/Main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

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

// ignore: camel_case_types, must_be_immutable
class All extends StatefulWidget {
  String selectedyear;
  // ignore: non_constant_identifier_names
  String Selectedmonth;
  All({
    super.key,
    required this.selectedyear,
    // ignore: non_constant_identifier_names
    required this.Selectedmonth,
  });

  @override
  State<All> createState() => _Transaction_InfoState();
}

// ignore: camel_case_types
class _Transaction_InfoState extends State<All> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: readJson(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  final data = snapshot.data!;
                  if (data[widget.selectedyear] == null) {
                    return const SizedBox();
                  } else if (data[widget.selectedyear][widget.Selectedmonth] ==
                      null) {
                    return const SizedBox();
                  }
                  return ListView.builder(
                    itemCount:
                        data[widget.selectedyear][widget.Selectedmonth].length,
                    itemBuilder: (context, index) {
                      var Category = data[widget.selectedyear]
                          [widget.Selectedmonth][index]["category"];
                      IconData icon = Icons.shopping_cart_outlined;
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
                        label: data[widget.selectedyear][widget.Selectedmonth]
                            [index]["category"],
                        time: data[widget.selectedyear][widget.Selectedmonth]
                            [index]["date"],
                        icon: icon,
                        color: color,
                        price: data[widget.selectedyear][widget.Selectedmonth]
                            [index]["amount"],
                        color1: data[widget.selectedyear][widget.Selectedmonth]
                                    [index]["type"] ==
                                "EXPENSE"
                            ? const Color.fromARGB(255, 255, 17, 0)
                            : Colors.green,
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
