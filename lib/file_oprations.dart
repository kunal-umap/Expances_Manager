import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

const String kFileName = 'data.json';

class FileOprations {
  Map<String, dynamic> _json = {};
  String jsonString = '';
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$kFileName');
  }

  Future<void> writeJson(String key, dynamic value) async {
    // Initialize the local _filePath
    final filePath = await _localFile;

    //1. Create _newJson<Map> from input<TextField>
    Map<String, dynamic> newJson = {key: value};
    // print('1.(_writeJson) _newJson: $newJson');
    //2. Update _json by adding _newJson<Map> -> _json<Map>
    _json.addAll(newJson);
    // print('2.(_writeJson) _json(updated): $_json');

    //3. Convert _json ->_jsonString
    jsonString = jsonEncode(_json);
    print('3.(_writeJson) _jsonString: $jsonString\n - \n');

    //4. Write _jsonString to the _filePath
    filePath.writeAsString(jsonString);
  }
  Future<void> writeJsonByData() async {
    final year = "2024";
    final month = "11";
  final incD = {
    "description": "ghar1",
    "mode": "Online",
    "category": "Eat",
    "date": "24-09-2023",
    "amount": "50",
    "type": "Expenses"
  };
    // Initialize the local _filePath
    final filePath = await _localFile;

    var data =await readJson();
    if(data != null && data[year] != null && data[year][month] != null){
      data[year][month].add(incD);
    }else if(data != null && data[year] != null){
      data[year][month] = [incD];
    }else {
      data.addAll({
        year: {
          month: [
            incD
          ]
        }
      });
    }
    // print('1.(_writeJson) _newJson: $newJson');
    //2. Update _json by adding _newJson<Map> -> _json<Map>
    _json.addAll(data);
    // _json = {};
    // print('2.(_writeJson) _json(updated): $_json');

    //3. Convert _json ->_jsonString
    jsonString = jsonEncode(_json);
    print('3.(_writeJson) _jsonString: $jsonString\n - \n');

    //4. Write _jsonString to the _filePath
    filePath.writeAsString(jsonString);
  }

  Future<Map<String,dynamic>> readJson() async {
    // Initialize _filePath
    File filePath = await _localFile;

    // 0. Check whether the _file exists
    // print('0. File exists? ${await filePath.exists()}');

    // If the _file exists->read it: update initialized _json by what's in the _file
    if (await filePath.exists()) {
      try {
        //1. Read _jsonString<String> from the _file.
        jsonString = await filePath.readAsString();
        print('1.(_readJson) _jsonString: $jsonString');

        //2. Update initialized _json by converting _jsonString<String>->_json<Map>
        _json = jsonDecode(jsonString);
        // print('2.(_readJson) _json: $_json \n - \n');
        return _json;
      } catch (e) {
        // Print exception errors
        print('Tried reading _file error: $e');
        // If encountering an error, return null
        return {'e':e};
      }
    }
    return {"data": null};
  }


}