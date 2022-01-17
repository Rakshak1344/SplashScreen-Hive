import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Logic/Provider/app_name_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? appName;
  late AppNameProvider _appNameProvider;

  @override
  void initState() {
    super.initState();
    _appNameProvider = Provider.of<AppNameProvider>(context, listen: false);
    _appNameProvider.fetchSplashScreen();
    appName = _appNameProvider.splashScreenModel?.appName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "$appName",
          style: const TextStyle(color: Colors.blue, fontSize: 24),
        ),
      ),
    );
  }
}
