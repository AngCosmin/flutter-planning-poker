import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  final String token = 'token';
  final String name = 'name';

  Future<void> setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this.token, token);
  }

  Future<String> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(this.token) ?? null;
  }

  Future<void> setName(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this.name, name);
  }

  Future<String> getName() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(this.name) ?? null;
  }
}