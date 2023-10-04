// ignore_for_file: unnecessary_getters_setters

class ConfigurationsModel {
  String _username = '';
  double _height = 0;
  bool _pushNotification = false;
  bool _darkTheme = false;

  ConfigurationsModel.empy() {
    _username = '';
    _height = 0;
    _pushNotification = false;
    _darkTheme = false;
  }

  ConfigurationsModel(
    this._username,
    this._height,
    this._pushNotification,
    this._darkTheme
  );

  String get userName => _username;

  set userName(String value) {
    _username = value;
  }

  double get height => _height;

  set height(double value) {
    _height = value;
  }

  bool get pushNotification => _pushNotification;

  set pushNotification(bool value) {
    _pushNotification = value;
  }

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
  }

}