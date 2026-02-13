import 'package:flutter/cupertino.dart';
import 'package:islamiapp/shared_prefs_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentprovider extends ChangeNotifier{
  List<int> mostrecent = [];
  void GetRecentList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecent = prefs.getStringList(SharedPrefsKeys.MostRecentKey)??[];
    mostrecent = mostRecent.map((element) {
      return int.parse(element);
    }).toList();
    notifyListeners();
  }
}