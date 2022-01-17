import 'package:hive/hive.dart';

import '../Constants/hive_box_names.dart';
import 'Model/splash_screen_model.dart';

class Boxes {
  static Box<SplashScreenModel> getSplashScreen() =>
      Hive.box<SplashScreenModel>(SPLASH_SCREEN_BOX);
}
