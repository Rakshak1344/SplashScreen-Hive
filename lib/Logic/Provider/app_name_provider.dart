import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../../Constants/hive_key_names.dart';
import '../../Constants/splash_screen_const.dart';
import '../../Data/Model/splash_screen_model.dart';
import '../../Data/hive_boxes.dart';

class AppNameProvider extends ChangeNotifier {
  SplashScreenModel? _splashScreenModel;
  SplashScreenModel? get splashScreenModel => _splashScreenModel;

  late Box<SplashScreenModel> _spBox;

  changeSplashScreenData(SplashScreenModel splashScreenModel) {
    _splashScreenModel = _setSplashScreen(splashScreenModel);
    notifyListeners();
  }

  fetchSplashScreen() {
    _spBox = Boxes.getSplashScreen();
    if (_spBox.values.isEmpty && _spBox.keys.isEmpty) {
      SplashScreenModel defaultSplashScreen = SplashScreenModel(
        appName: DEFAULT_APP_NAME,
        updatedAt: DEFAULT_APP_NAME_DATETIME,
      );
      _splashScreenModel = _setSplashScreen(defaultSplashScreen);
    } else {
      _splashScreenModel = _getSplashScreen();
    }
  }

  SplashScreenModel? _setSplashScreen(SplashScreenModel splashScreenModel) {
    _spBox = Boxes.getSplashScreen();
    _spBox.put(SPLASHSCREEN_KEY, splashScreenModel);
    SplashScreenModel? data = _getSplashScreen();
    return data;
  }

  SplashScreenModel? _getSplashScreen() => _spBox.get(SPLASHSCREEN_KEY);
}
