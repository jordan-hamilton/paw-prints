import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'db/database_manager.dart';

void main() async {
  const String title = 'Paw Prints';

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);

  await DatabaseManager.initialize();
  
  runApp(
    App(
      title: title,
      prefs: await SharedPreferences.getInstance()
    )
  );
}