import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tikkandoo/route/router.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _deviceOrientation();
  //await Upgrader.clearSavedSettings();
  runApp(App(router: AppRouter()));
}
_deviceOrientation() async {
  try {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  } catch (e) {
    return Future.error(e);
  }
}


