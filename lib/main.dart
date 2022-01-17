import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'Constants/hive_box_names.dart';
import 'Data/Model/splash_screen_model.dart';
import 'Logic/Provider/app_name_provider.dart';
import 'home_screen.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SplashScreenModelAdapter());
  await Hive.openBox<SplashScreenModel>(SPLASH_SCREEN_BOX);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AppNameProvider())],
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue),
        home: AnimatedSplashScreen(
          splash: const SplashScreen(),
          nextScreen: const HomeScreen(),
          splashTransition: SplashTransition.slideTransition,
          animationDuration: const Duration(milliseconds: 1000),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
