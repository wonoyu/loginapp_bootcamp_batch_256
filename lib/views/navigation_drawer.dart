import 'file:///C:/flutterprojects/batch_256/lib/components/custom_alert_dialog.dart';
import 'file:///C:/flutterprojects/batch_256/lib/components/custom_confirmation_dialog.dart';
import 'package:batch_256/models/list_users_model.dart';
import 'package:batch_256/utilities/routes.dart';
import 'package:batch_256/utilities/shared_preferences.dart';
import 'package:batch_256/views/dashboardscreen.dart';
import 'package:batch_256/views/registerscreen.dart';
import 'package:batch_256/views/transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loginscreen.dart';
import 'loginscreenreqres.dart';
import 'package:batch_256/views/menu/details/detailuserscreen.dart';
import '../components/custom_expansion_tile.dart' as custom;

const List<Color> orangeGradients = [
  Color(0xFFFF9844),
  Color(0xFFFE8853),
  Color(0xFFFD7267),
];

class NavigationDrawer extends StatefulWidget {
  final Datum dataq;
  NavigationDrawer({this.dataq});
  @override
  NavigationDrawerState createState() => NavigationDrawerState();
}

class NavigationDrawerState extends State<StatefulWidget> {
  String username = "";
  void initState() {
    super.initState();
    SharedPreferencesHelper.readUsername().then((value) {
      setState(() {
        username = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
              child: ListView(
            children: [
              createHeaderMenu(context),
              SizedBox(
                width: 20,
              ),
              createContentMenu(context),
            ],
          )),
          Padding(
            padding: EdgeInsets.only(
              left: 80,
              right: 40,
              top: 10,
              bottom: 10,
            ),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1.7,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                gradient: LinearGradient(
                    colors: orangeGradients,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: TextButton(
                child: Text(
                  "Logout",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  var confirmationDialog = CustomConfirmationDialog(
                    title: "Konfirmasi",
                    message: "Apakah Anda yakin ingin Logout?",
                    yes: "Ya",
                    no: "Tidak",
                    pressYes: () {
                      //jadi logout
                      //1. ganti flag islogin = false
                      SharedPreferencesHelper.saveIsLogin(false);
                      //2. pop dialog
                      Navigator.of(context).pop();
                      //3. pindah ke login screen
                      ruteLoginScreenReqRes(context);
                    },
                    pressNo: () {
                      //tidak jadi logout
                      Navigator.of(context).pop();
                    },
                  );
                  showDialog(
                      context: context, builder: (_) => confirmationDialog);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createHeaderMenu(BuildContext context) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/dwqf.jpeg'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Versi 1.0",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500))),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(
                    "assets/images/mashaz.jpg",
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Container(
              padding: EdgeInsets.only(left: 125, top: 10, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Hi, ${NavigationDrawer().dataq.firstName}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }

  Widget createContentMenu(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          margin: EdgeInsets.fromLTRB(5, 3, 5, 3),
          color: Colors.purple,
          child: ListTile(
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    CupertinoIcons.home,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Dashboard",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(ScaleRoute(page: DashboardScreen()));
            },
          ),
        ),
        Card(
          margin: EdgeInsets.fromLTRB(5, 3, 5, 3),
          child: custom.ExpansionTile(
            headerBackgroundColor: Colors.lightBlue,
            iconColor: Colors.white,
            leading: Icon(
              CupertinoIcons.gear_solid,
              color: Colors.white,
            ),
            title: Transform(
              transform: Matrix4.translationValues(-10, 0, 0),
              child: Text(
                "Administrator",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        CupertinoIcons.minus,
                        color: Colors.lightBlue,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Daftar Pengguna",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        CupertinoIcons.minus,
                        color: Colors.lightBlue,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Edit Password",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        CupertinoIcons.minus,
                        color: Colors.lightBlue,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Laporan Bulanan",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void ruteLoginScreen(BuildContext context) {
  // Navigator.of(context).popAndPushNamed(Routes.loginscreen);
  // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
  //   return DashboardScreen();
  Navigator.of(context).pushReplacement(ScaleRoute(page: LoginScreen()));
  // }));
}

void ruteLoginScreenReqRes(BuildContext context) {
  // Navigator.of(context).popAndPushNamed(Routes.loginscreen);
  // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
  //   return DashboardScreen();
  Navigator.of(context).pushReplacement(ScaleRoute(page: LoginScreenReqRes()));
  // }));
}

void showAlert(BuildContext context, String _title, String _message) {
  var alertDialog = CustomConfirmationDialog(
    title: _title,
    message: _message,
    yes: "Konfirmasi",
    no: "Cancel",
  );
  showDialog(context: context, builder: (_) => alertDialog);
}
