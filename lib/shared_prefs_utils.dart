import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKeys{
  static const String MostRecentKey = "most_recent";
}
Future<void> SaveLastSuraIndex(int suraindex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> MostRecentList = prefs.getStringList(SharedPrefsKeys.MostRecentKey)??[];
  if(MostRecentList.contains('$suraindex')){
    MostRecentList.remove('$suraindex');
    MostRecentList.insert(0, '$suraindex');
  }else{
    MostRecentList.insert(0, '$suraindex');
  }
  if(MostRecentList.length > 5){
    MostRecentList.removeLast();
  }

  await prefs.setStringList(SharedPrefsKeys.MostRecentKey, MostRecentList);

}
