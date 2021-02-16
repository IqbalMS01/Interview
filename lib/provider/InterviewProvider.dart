import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InterviewProvider with ChangeNotifier {
  List<int> list = new List();
  SharedPreferences preferences;

  List<int> get listNumber => list;
  SharedPreferences get prefs => preferences;

  void setList(List<int> newList) {
    list = newList;
    notifyListeners();
  }

  Future<SharedPreferences> initPreference() async {
    preferences = await SharedPreferences.getInstance();
    return preferences;
  }
}
