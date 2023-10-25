import 'dart:typed_data';
import 'package:expances_management/file_manager.dart';
import 'package:expances_management/model/user_data.dart';
import 'package:flutter/material.dart';


class FileController extends ChangeNotifier {

  late User _user;

  User get user => _user;

  readUser() async {
    final result = await FileManager().readJsonFile();

    if (result != null) {
      _user = User.fromJson(await FileManager().readJsonFile());
    }

    notifyListeners();
  }

  writeUser() async {
    _user = await FileManager().writeJsonFile();
    notifyListeners();
  }

}