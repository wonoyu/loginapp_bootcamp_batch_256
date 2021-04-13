import 'dart:async';
import 'package:batch_256/utilities/shared_preferences.dart';
import 'package:batch_256/views/loginscreenreqres.dart';
import 'package:batch_256/views/transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:batch_256/views/loginscreen.dart';
import 'dashboardscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = Duration(seconds: 5);
    return Timer(duration, callback);
  }

  callback() {
    //logic apakah sudah login
    SharedPreferencesHelper.readIsLogin().then((value) {
      if (value) {
        ruteDashboardScreen(context);
      } else {
        ruteLoginScreenReqRes(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //buat layout dimari
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/bglogin.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        width: size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logoeagles.png',
                width: 150,
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, right: 10, bottom: 20, left: 10),
              ),
              Text(
                'Batch 256 Flutter  ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0XFFFFFFFF),
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                    fontFamily: 'Raleway'),
              ),
              SizedBox(
                height: 10.0,
              ),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "Versi ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'BiomeRegular',
                    )),
                TextSpan(
                  text: "1.0",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'BiomeRegular',
                  ),
                )
              ])),
            ],
          ),
        ),
      ),
    );
  }

  void ruteDashboardScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(ScaleRoute(page: DashboardScreen()));
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
    //   return DashboardScreen();
    // }));
  }

  void ruteLoginScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(ScaleRoute(page: LoginScreen()));
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
    //   return LoginScreen();
    // }));
  }

  void ruteLoginScreenReqRes(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(ScaleRoute(page: LoginScreenReqRes()));
  }
}
