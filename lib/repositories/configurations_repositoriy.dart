import 'package:hive/hive.dart';
import 'package:trilhaapp/model/configuration_model.dart';

class ConfigurationsRepository {
  static late Box _box;

  ConfigurationsRepository._create();

  static Future<ConfigurationsRepository> load() async {
    if (Hive.isBoxOpen('configurations')) {
      _box = Hive.box('configurations');
    } else {
      _box = await Hive.openBox('configurations');
    }
    return ConfigurationsRepository._create();
  }

  void save(ConfigurationsModel configurationsModel) {
    _box.put('configurationsModel', {
      'userName': configurationsModel.userName,
      'height': configurationsModel.height,
      'pushNotification': configurationsModel.pushNotification,
      'darkTheme': configurationsModel.darkTheme,
    });
  }

  ConfigurationsModel getData() {
    var configurations = _box.get('configurationsModel');
    if (configurations == null) {
      return ConfigurationsModel.empy();
    }

    return ConfigurationsModel(
      configurations['userName'],
      configurations['height'],
      configurations['pushNotification'],
      configurations['darkTheme']);
  }
}