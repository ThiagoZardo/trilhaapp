// ignore_for_file: constant_identifier_names, camel_case_types

import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_KEYS {
  KEY_NAME,
  KEY_BIRTH_DATE,
  KEY_LEVEL, 
  KEY_LANGUAGES,
  KEY_TIME_EXPERIENCE,
  KEY_SALARY_CHOSEN,
  KEY_USER_NAME,
  KEY_HEIGHT,
  KEY_PUSH_NOTIFICATION,
  KEY_DARK_THEME,
  KEY_RANDOM_NUMBER,
  KEY_QTD_CLICKS,
}

class AppStorageService {

  void setRegistrionDataQtdClicks(int value) async {
    _setInt(STORAGE_KEYS.KEY_QTD_CLICKS.toString(), value);
  }

  Future<int> getRegistrionDataQtdClicks() async {
    return _getInt(STORAGE_KEYS.KEY_QTD_CLICKS.toString());
  }

  void setRegistrionDataRandomNumber(int value) async {
    _setInt(STORAGE_KEYS.KEY_RANDOM_NUMBER.toString(), value);
  }

  Future<int> getRegistrionDataRandomNumber() async {
    return _getInt(STORAGE_KEYS.KEY_RANDOM_NUMBER.toString());
  }

  void setRegistrionDataDarkTheme(bool value) async {
    _setBool(STORAGE_KEYS.KEY_DARK_THEME.toString(), value);
  }

  Future<bool> getRegistrionDataDarkTheme() async {
    return _getBool(STORAGE_KEYS.KEY_DARK_THEME.toString());
  }

  void setRegistrionDataPushNotification(bool value) async {
    _setBool(STORAGE_KEYS.KEY_PUSH_NOTIFICATION.toString(), value);
  }

  Future<bool> getRegistrionDataPushNotification() async {
    return _getBool(STORAGE_KEYS.KEY_PUSH_NOTIFICATION.toString());
  }

  void setRegistrionDataHeight(double value) async {
    _setDouble(STORAGE_KEYS.KEY_HEIGHT.toString(), value);
  }

  Future<double> getRegistrionDataUserHeight() async {
    return _getDouble(STORAGE_KEYS.KEY_HEIGHT.toString());
  }

  void setRegistrionDataUserName(String name) async {
    _setString(STORAGE_KEYS.KEY_USER_NAME.toString(), name);
  }

  Future<String> getRegistrionDataUserName() async {
    return _getString(STORAGE_KEYS.KEY_USER_NAME.toString());
  }

  void setRegistrionDataName(String name) async {
    _setString(STORAGE_KEYS.KEY_NAME.toString(), name);
  }

  Future<String> getRegistrionDataName() async {
    return _getString(STORAGE_KEYS.KEY_NAME.toString());
  }

  void setRegistrionDataBirthDate(String date) async {
    _setString(STORAGE_KEYS.KEY_BIRTH_DATE.toString(), date);
  }

  Future<String> getRegistrionDataBirthDate() async {
    return _getString(STORAGE_KEYS.KEY_BIRTH_DATE.toString());
  }

  void setRegistrionDataLevel(String level) async {
    _setString(STORAGE_KEYS.KEY_LEVEL.toString(), level);
  }

  Future<String> getRegistrionDataLevel() async {
    return _getString(STORAGE_KEYS.KEY_LEVEL.toString());
  }

  void setRegistrionLanguages(List<String> languages) async {
    _setStringList(STORAGE_KEYS.KEY_LANGUAGES.toString(), languages);
  }

  Future<List<String>> getRegistrionDataLanguages() async {
    return _getStringList(STORAGE_KEYS.KEY_LANGUAGES.toString());
  }

  void setRegistrionDataTimeExperience(int time) async {
    _setInt(STORAGE_KEYS.KEY_TIME_EXPERIENCE.toString(), time);
  }

  Future<int> getRegistrionDataTimeExperience() async {
    return _getInt(STORAGE_KEYS.KEY_TIME_EXPERIENCE.toString());
  }

  void setRegistrionDataSalaryChosen(double salary) async {
    _setDouble(STORAGE_KEYS.KEY_SALARY_CHOSEN.toString(), salary);
  }

  Future<double> getRegistrionDataSalaryChosene() async {
    return _getDouble(STORAGE_KEYS.KEY_SALARY_CHOSEN.toString());
  }

  _setString(String key, String value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setString(key, value);
  }

  Future<String> _getString(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(key) ?? '';
  }

  _setStringList(String key, List<String> values) async {
    var storage = await SharedPreferences.getInstance();
    storage.setStringList(key, values);
  }

  Future<List<String>> _getStringList(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(key) ?? [];
  }

  _setInt(String key, int value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setInt(key, value);
  }

  Future<int> _getInt(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(key) ?? 0;
  }

  _setDouble(String key, double value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setDouble(key, value);
  }

  Future<double> _getDouble(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(key) ?? 0;
  }

  _setBool(String key, bool value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setBool(key, value);
  }

  Future<bool> _getBool(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(key) ?? false;
  }

}