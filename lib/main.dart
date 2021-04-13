import 'package:batch_256/views/loginscreenreqres.dart';
import 'package:batch_256/views/menu/parsingdata.dart';
import 'package:batch_256/views/registerscreen.dart';
import 'package:batch_256/views/splashscreen.dart';
import 'package:batch_256/views/loginscreen.dart';
import 'package:batch_256/views/splashscreenanimate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:batch_256/utilities/routes.dart';
import 'package:batch_256/views/dashboardscreen.dart';

import 'views/menu/details/detailuserscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //lockscreen orientation
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Batch 256',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
      routes: {
        Routes.splashscreen: (context) => SplashScreen(),
        Routes.loginscreen: (context) => LoginScreen(),
        Routes.registerscreen: (context) => RegisterScreen(),
        Routes.dashboardscreen: (context) => DashboardScreen(),
        Routes.parsingdata: (context) => ParsingDataScreen(),
        Routes.detailuserscreen: (context) => DetailUserScreen(),
        Routes.loginscreenreqres: (context) => LoginScreenReqRes(),
      },
    );
  }
}
