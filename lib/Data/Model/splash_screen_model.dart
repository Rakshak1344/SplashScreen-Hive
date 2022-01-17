import 'package:hive/hive.dart';

part 'splash_screen_model.g.dart';

@HiveType(typeId: 0)
class SplashScreenModel {
  @HiveField(0)
  late String? appName;

  @HiveField(1)
  late DateTime? updatedAt;

  SplashScreenModel({this.appName = "Chinta money", this.updatedAt});
}
