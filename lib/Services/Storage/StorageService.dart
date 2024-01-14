import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_flutter_app/Common/ENV.dart';

class StorageService {
  late SharedPreferences prefs;
  final String basePref = ENV.appName;
  late final String isLoggedInPref;
  late final String loginDataPref;

  getInstance() async {
    prefs = await SharedPreferences.getInstance();
  }

  StorageService() {
    // SharedPreferences.getInstance().then((prefInstance) => {
    //   prefs = prefInstance,
    // });
    getInstance(); 
    isLoggedInPref = "${basePref}_LOGIN";
    loginDataPref = "${basePref}_LOGINDATA";
  }

  Future<bool> saveStringToStorage(String key, String value) async {
    if(key.isEmpty) return false;
    bool isSaved = false;
    isSaved = await prefs.setString(key, value);
    return isSaved;
  }

  String? getStringFromStorage(String key) {
    // final prefs = await SharedPreferences.getInstance();
    String? output = prefs.getString(key);
    return output;
  }

  Future<bool> removeFromStorage(String key) async {
    // final prefs = await SharedPreferences.getInstance();
    bool output = await prefs.remove(key);
    return output;
  }

  Future<bool> saveBoolToStorage(String key, bool value) async {
    if(key.isEmpty) return false;
    bool output = await prefs.setBool(key, value);
    return output;
  }

  bool getBoolFromStorage(String key) {
    return prefs.getBool(key) ?? false;
  } 
}