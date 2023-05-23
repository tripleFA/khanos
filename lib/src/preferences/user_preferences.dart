import 'package:shared_preferences/shared_preferences.dart';

/*
  Recordar instalar el paquete de:
    shared_preferences:
  Inicializar en el main
    final prefs = new UserPreferences();
    await prefs.initPrefs();
    
    Recuerden que el main() debe de ser async {...
*/

class UserPreferences {
  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  String get endpoint {
    return _prefs.getString('endpoint') ?? '';
  }

  set endpoint(String value) {
    _prefs.setString('endpoint', value);
  }

  String get url {
    return _prefs.getString('url') ?? '';
  }

  set url(String value) {
    _prefs.setString('url', value);
  }

  String get username {
    return _prefs.getString('username') ?? '';
  }

  set username(String value) {
    _prefs.setString('username', value);
  }

  int get userId {
    return _prefs.getInt('userId') ?? 0;
  }

  set userId(int id) {
    _prefs.setInt('userId', id);
  }

  String get password {
    return _prefs.getString('password') ?? '';
  }

  set password(String value) {
    _prefs.setString('password', value);
  }

  bool get authFlag {
    return _prefs.getBool('authFlag') ?? false;
  }

  set authFlag(bool value) {
    _prefs.setBool('authFlag', value);
  }

  bool get darkTheme {
    return _prefs.getBool('darkTheme') ?? false;
  }

  set darkTheme(bool value) {
    _prefs.setBool('darkTheme', value);
  }

  bool get newInstall {
    return _prefs.getBool('newInstall') ?? false;
  }

  set newInstall(bool value) {
    _prefs.setBool('newInstall', value);
  }

  bool get firstTime {
    return _prefs.getBool('firstTime') ?? true;
  }

  set firstTime(bool value) {
    _prefs.setBool('firstTime', value);
  }

  String get buildNumber {
    return _prefs.getString('buildNumber') ?? '';
  }

  set buildNumber(String value) {
    _prefs.setString('buildNumber', value);
  }

  String get appRole {
    return _prefs.getString('appRole') ?? '';
  }

  set appRole(String value) {
    _prefs.setString('appRole', value);
  }
}
