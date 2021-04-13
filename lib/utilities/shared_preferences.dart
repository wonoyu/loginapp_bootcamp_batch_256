import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferencesHelper();
  static final String KEY_ISLOGIN = "KEY ISLOGIN";
  static final String KEY_USERNAME = "KEY USERNAME";
  static final String KEY_PASSWORD = "KEY PASSOWRD";
  static final String KEY_ISREMEMBER = "KEY_ISREMEMBER";
  static final String KEY_TOKEN = "KEY_TOKEN";

  static Future<SharedPreferences> get sharedpreferences =>
      SharedPreferences.getInstance();

  //untuk simpan islogin (flag)
  static Future saveIsLogin(bool islogin) async {
    final pref = await sharedpreferences;
    return pref.setBool(KEY_ISLOGIN, islogin);
  }

  //unutuk panggil islogin
  static Future<bool> readIsLogin() async {
    final pref = await sharedpreferences;
    return pref.getBool(KEY_ISLOGIN) ?? false;
  }

  //untuk simpan username
  static Future saveUsername(String username) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_USERNAME, username);
  }

  //untuk panggil username
  static Future<String> readUsername() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_USERNAME) ?? "";
  }

  //untuk simpan password
  static Future savePassword(String password) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_PASSWORD, password);
  }

  //untuk panggil password
  static Future<String> readPassword() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_PASSWORD) ?? "";
  }

  //untuk simpan isremember (flag)
  static Future saveIsRemember(bool isremember) async {
    final pref = await sharedpreferences;
    return pref.setBool(KEY_ISREMEMBER, isremember);
  }

  //untuk panggil isremember
  static Future<bool> readIsRemember() async {
    final pref = await sharedpreferences;
    return pref.getBool(KEY_ISREMEMBER) ?? false;
  }

  //untuk simpan token
  static Future saveToken(String token) async {
    final pref = await sharedpreferences;
    return pref.setString(KEY_TOKEN, token);
  }

  //untuk panggil token
  static Future<String> readToken() async {
    final pref = await sharedpreferences;
    return pref.getString(KEY_TOKEN) ?? "";
  }

  //clear semua data yang disimpan
  static Future clearAllData() async {
    final pref = await sharedpreferences;
    await Future.wait(<Future>{
      pref.setBool(KEY_ISLOGIN, false),
      pref.setString(KEY_USERNAME, ""),
      pref.setString(KEY_PASSWORD, ""),
      pref.setString(KEY_TOKEN, ""),
    });
  }
}
