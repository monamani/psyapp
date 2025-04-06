import 'package:mypsy_app/helpers/app_config.dart';

import 'package:mypsy_app/env/prod.dart';
import 'package:mypsy_app/main.dart' as app;

void main() {
  // set config to prod
  AppConfig.fromJson(config);
  app.main(env: 'prod');
}
