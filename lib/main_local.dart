import 'package:mypsy_app/helpers/app_config.dart';

import 'package:mypsy_app/env/local.dart';
import 'package:mypsy_app/main.dart' as app;

void main() {
  AppConfig.fromJson(config);
  app.main(env: 'dev');
}
