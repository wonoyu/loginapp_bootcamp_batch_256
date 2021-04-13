import 'file:///C:/flutterprojects/batch_256/lib/components/custom_alert_dialog.dart';
import 'package:batch_256/utilities/shared_preferences.dart';
import 'package:batch_256/views/menu/parsingdata.dart';
import 'package:batch_256/views/transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loginscreen.dart';
import 'navigation_drawer.dart';
import 'package:batch_256/components/buttons/parsingdatabutton.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<StatefulWidget> {
  String username = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
          title: Text("Dashboard Menu"),
        ),
        drawer: NavigationDrawer(),
        body: GestureDetector(
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: DashboardScreenLayout()),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SharedPreferencesHelper.readUsername().then((value) {
      setState(() {
        username = value;
      });
    });

    SharedPreferencesHelper.readPassword().then((value) {
      setState(() {
        password = value;
      });
    });

    // SharedPreferencesHelper.clearAllData();
  }

  void ruteLoginScreen(BuildContext context) {
    Route _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            ScaleTransition(
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            ),
          ),
          child: child,
        ),
      );
    }

    Navigator.of(context).pushReplacement(ScaleRoute(page: LoginScreen()));
  }
}

class DashboardScreenLayout extends StatefulWidget {
  @override
  DashboardScreenLayoutState createState() => DashboardScreenLayoutState();
}

class DashboardScreenLayoutState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        Card(
          color: Colors.white38,
          shadowColor: Colors.black87,
          elevation: 10.0,
          child: BouncingButton(),
        ),
        Card(
          color: Colors.white38,
          shadowColor: Colors.black87,
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  CupertinoIcons.photo,
                  color: Colors.white,
                  size: 100,
                ),
                Text(
                  "Imaging",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(context, ScaleRoute(page: ParsingDataScreen()));
            },
          ),
        ),
        Card(
          color: Colors.pinkAccent,
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  CupertinoIcons.camera,
                  color: Colors.white,
                  size: 100,
                ),
                Text(
                  "Camera",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(context, ScaleRoute(page: ParsingDataScreen()));
            },
          ),
        ),
        Card(
          color: Colors.greenAccent,
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  CupertinoIcons.doc,
                  color: Colors.white,
                  size: 100,
                ),
                Text(
                  "Databases",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(context, ScaleRoute(page: ParsingDataScreen()));
            },
          ),
        ),
        Card(
          color: Colors.purpleAccent,
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  CupertinoIcons.location,
                  color: Colors.white,
                  size: 100,
                ),
                Text(
                  "Location Services",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(context, ScaleRoute(page: ParsingDataScreen()));
            },
          ),
        ),
        Card(
          color: Colors.brown,
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  CupertinoIcons.map,
                  color: Colors.white,
                  size: 100,
                ),
                Text(
                  "Map Services",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(context, ScaleRoute(page: ParsingDataScreen()));
            },
          ),
        ),
        Card(
          color: Colors.black,
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  CupertinoIcons.compass,
                  color: Colors.white,
                  size: 100,
                ),
                Text(
                  "State Management",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(context, ScaleRoute(page: ParsingDataScreen()));
            },
          ),
        ),
      ],
    );
  }
}

//Container(
//       child: Scaffold(
//         body: GestureDetector(
//           child: Row(
//             children: <Widget>[
//               SizedBox(
//                 height: 100,
//               ),
//               Text(
//                 "Username = $username, Password = $password",
//               ),
//               TextButton(
//                 onPressed: () {
//                   //1:flag islogin jadikan false
//                   SharedPreferencesHelper.saveIsLogin(false);
//                   //2: buang screen dashboarad tampilkan login
//                   ruteLoginScreen(context);
//                 },
//                 child: Text('Logout'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
