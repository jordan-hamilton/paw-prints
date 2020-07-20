import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'db/database_manager.dart';

void main() async {
  
  const title = 'Paw Prints';
  const SCHEMA_PATH = 'assets/schema.sql';
  
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);

  String schema = await rootBundle.loadString(SCHEMA_PATH);
  await DatabaseManager.initialize(schema);
  
  runApp(
    App(
      title: title,
      prefs: await SharedPreferences.getInstance()
    )
  );
}