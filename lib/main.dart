import 'dart:io';

import 'package:mypsy_app/app.dart';
import 'package:mypsy_app/helpers/app_config.dart';
import 'package:mypsy_app/shared/ui/device_types.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mypsy_app/env/dev.dart';

Future<void> main({String? env}) async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory? directory;
  if (Device.get().isIos! && !kIsWeb) {
    directory = await getApplicationDocumentsDirectory();
  } else {
    directory = await getExternalStorageDirectory();
  }
  Hive.init(directory!.path);
  if (env == null) {
    AppConfig.fromJson(config);
    env = 'dev';
  }

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  ).then((_) {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details); // Logs the error in debug mode
      runApp(
        MyApp(
          showError: true,
          errorDetails: details,
        ),
      );
    };
  });

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  ).then((_) {
    runApp(MyApp());
  });
}
