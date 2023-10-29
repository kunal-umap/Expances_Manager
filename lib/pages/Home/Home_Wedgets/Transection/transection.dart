import 'dart:convert';
import 'dart:io';
import 'package:expances_management/file_oprations.dart';
import 'package:expances_management/pages/Home/Home_Wedgets/GraphSection/Graph.dart';
import 'package:expances_management/pages/Home/Home_Wedgets/Transection/MainTransactionPage.dart';
import 'package:expances_management/pages/Home/Home_Wedgets/Transection/ViewTransaction.dart';
import 'package:flutter/material.dart';
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
            padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Latest transaction",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 300,
            child: FutureBuilder(
              future: readJson(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  final data = snapshot.data!;
                  if (data["$selectedyear"] == null) {
                    return const Center(
                        child: Text("Please add data to show something"));
                  } else if (data["$selectedyear"]["$selectedmonth"].length ==
                      1) {
                    return Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 70,
                          child: MainTransactionPage(
                            data: data,
                            selectedyear: selectedyear,
                            selectedmonth: selectedmonth,
                          ),
                        ),
                        const ViewTransaction(),
                      ],
                    );
                  } else if (data["$selectedyear"]["$selectedmonth"].length ==
                      2) {
                    return Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 135,
                          child: MainTransactionPage(
                            data: data,
                            selectedyear: selectedyear,
                            selectedmonth: selectedmonth,
                          ),
                        ),
                        const ViewTransaction(),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: MainTransactionPage(
                            data: data,
                            selectedyear: selectedyear,
                            selectedmonth: selectedmonth,
                          ),
                        ),
                        const ViewTransaction(),
                      ],
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
