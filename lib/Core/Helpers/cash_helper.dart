import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static late SharedPreferences prefs;
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static dynamic getData({required String key}) {
    return prefs.get(key);
  }

  static List<String> getListData({required String key}) {
    return prefs.getStringList(key) ?? [];
  }

  static Future<bool> removeData({required String key}) async {
    return await prefs.remove(key);
  }

  static Future<bool> clearPrefs() async {
    return await prefs.clear();
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) return await prefs.setString(key, value);
    if (value is List<String>) return await prefs.setStringList(key, value);
    if (value is int) return await prefs.setInt(key, value);
    if (value is bool) return await prefs.setBool(key, value);
    return await prefs.setDouble(key, value);
  }
}
