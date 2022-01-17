import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/Data/Model/splash_screen_model.dart';

import 'Logic/Provider/app_name_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  final TextEditingController _splashScreenNameController =
      TextEditingController();
  late AppNameProvider _appNameProvider;

  @override
  void initState() {
    super.initState();
    Provider.of<AppNameProvider>(context, listen: false).fetchSplashScreen();
  }

  setAppName() {
    SplashScreenModel? _splashScreenModelData = SplashScreenModel(
      appName: _splashScreenNameController.text.trim(),
      updatedAt: DateTime.now(),
    );
    _appNameProvider.changeSplashScreenData(_splashScreenModelData);
  }

  @override
  Widget build(BuildContext context) {
    _appNameProvider = Provider.of<AppNameProvider>(context);
    // SplashScreenModel splashScreenModel = box.get(APP_NAME);
    return Scaffold(
        appBar: AppBar(
          title: Text("${_appNameProvider.splashScreenModel?.appName}"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                  "Current App Name is ${_appNameProvider.splashScreenModel?.appName}"),
              Text(
                  "Updated at ${_appNameProvider.splashScreenModel?.updatedAt}"),
              TextField(
                controller: _splashScreenNameController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              InkWell(
                onTap: () => setAppName(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Text(
                      "Set",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}


 // findIfThereIsDataInHive() async {
  //   // AppNameProvider provider =
  //       Provider.of<AppNameProvider>(context, listen: false).fetchAppName();
  //   // provider.fetchAppName();

  //   // SplashScreenModel? data = provider.splashScreenModel;
  //   //  print("APPNAME ===> ${data?.appName}");

  //   // spBox = Boxes.getSplashScreen();
  //   // if (spBox.values.isEmpty) {
  //   //   SplashScreenModel spModel = SplashScreenModel(appName: "Chinta Money");
  //   //   spBox.put(APP_NAME, spModel);
  //   //   SplashScreenModel? data = spBox.get(APP_NAME);
  //   //   print("APPNAME ===> ${data?.appName}");
  //   // }
  // }
  // print(spBox.get(APP_NAME)?.appName.toString());
  // splashScreenModel = splashScreenBox.getAt(0)?.appName;


 // ValueListenableBuilder<Box<SplashScreenModel>>(
        //   valueListenable: Boxes.getSplashScreen().listenable(),
        //   builder: (context, Box<SplashScreenModel> box, _) {
        //     print(box.keys);
        //     print(box.values);
        //     return Center(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: <Widget>[
        //           // TextField(
        //           //   controller: _splashScreenNameController,
        //           //   decoration: InputDecoration(
        //           //     border: UnderlineInputBorder(
        //           //       borderRadius: BorderRadius.circular(6),
        //           //     ),
        //           //   ),
        //           // ),
        //           ElevatedButton(
        //             onPressed: () async {
        //               SplashScreenModel _splashScreenModel =
        //                   SplashScreenModel(appName: "Kichigo");
        //               await box.add(_splashScreenModel);
        //               // box.put(APP_NAME, _splashScreenModel);
        //             },
        //             child: const Text("Set"),
        //           )
        //         ],
        //       ),
        //     );
        //   },
        // ),