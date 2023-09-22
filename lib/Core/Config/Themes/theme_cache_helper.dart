import 'package:shared_preferences/shared_preferences.dart';

class ThemeCacheHelper {
  Future<void> cacheTheme(int isDark) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("isDark", isDark);
  }

  Future<int> getCachedThemeIndex() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedTheme = sharedPreferences.getInt("isDark");
    if (cachedTheme != null) {
      return cachedTheme;
    } else {
      return 0;
    }
  }
}
