import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:trilhaapp/pages/my_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentsDirectory = await path_provider.getApplicationCacheDirectory();
  Hive.init(documentsDirectory.path);
  runApp(const MyApp());
}
