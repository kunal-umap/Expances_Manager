import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

import 'model/user_data.dart';

class FileManager {
  static FileManager? _instance;

  FileManager._internal() {
    _instance = this;
  }

  factory FileManager() => _instance ?? FileManager._internal();

  Future<String?> get _directoryPath async {
    Directory directory = await getApplicationDocumentsDirectory();
    // Directory? directory = await getExternalStorageDirectory();

    // return directory?.path;
    return directory.path;
  }

  Future<File> get _jsonFile async {
    final path = await _directoryPath;
    return File('$path/data.json');
  }

  Future<Map<String, dynamic>> readJsonFile() async {
    File file = await _jsonFile;
    if (await file.exists()) {
      try {
        print("object");
        final fileContent = await file.readAsString();
        return json.decode(fileContent);
      } catch (e) {
        return {'e':e};
      }
    }
    return {};


  }

  Future<User> writeJsonFile() async {
    final User user = User('Julian', 36, ['Jewels', 'Juice', 'J']);

    File file = await _jsonFile;
    await file.writeAsString(json.encode(user));
    print(user);
    return user;
  }

}