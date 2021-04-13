import 'package:batch_256/utilities/shared_preferences.dart';
import 'package:batch_256/views/registerscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:batch_256/views/splashscreen.dart';
import 'file:///C:/flutterprojects/batch_256/lib/components/custom_alert_dialog.dart';
import 'transition.dart';

import 'dashboardscreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //initially password is obscure
  final TextEditingController _controllerUsername = new TextEditingController();
  final TextEditingController _controllerPassword = new TextEditingController();
  bool obscureText = true;
  String username = "";
  String password = "";
  bool showPwd = false;
  bool isRememberMe = false;
  List<Color> orangeGradients = [
    Color(0xFFFF9844),
    Color(0xFFFE8853),
    Color(0xFFFD7267),
  ];

  List<Color> blueGradients = [
    Color(0xFF1976D2),
    Color(0xFF3949AB),
    Color(0xFF90CAF9),
  ];

  //toggles the password show/hide status
  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    //mengetahui ukuran layar
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //   title: Text("Login Form"),
        // ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Image.asset(
                  'assets/images/logomusic.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Login Page",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'BiomeRegular',
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Material(
                    elevation: 10.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 40,
                        right: 20,
                        top: 10,
                        bottom: 10,
                      ),
                      child: TextField(
                          controller: _controllerUsername,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Input username',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          onChanged: (value) {
                            //set value
                            username = value;
                          }),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Material(
                    elevation: 10.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 40,
                        right: 20,
                        top: 10,
                        bottom: 10,
                      ),
                      child: TextField(
                          controller: _controllerPassword,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Input password',
                              hintStyle: TextStyle(color: Colors.grey),
                              suffix: InkWell(
                                onTap: toggle,
                                child: Icon(
                                  obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              )),
                          obscureText: obscureText,
                          onChanged: (value) {
                            //set value
                            password = value;
                          }),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: CheckboxListTile(
                      title: Text("Remember Me"),
                      value: isRememberMe,
                      onChanged: (newValue) {
                        setState(() {
                          isRememberMe = newValue;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    )),
                Padding(
                  padding: EdgeInsets.only(
                    left: 40,
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
                        "Login Now!",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        validateLogin(context);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 40,
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
                          colors: blueGradients,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                    ),
                    child: TextButton(
                      child: Text(
                        "Create New Account",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        ruteRegisterScreen(context);
                      },
                    ),
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    SharedPreferencesHelper.readIsRemember().then((value) {
      if (value) {
        SharedPreferencesHelper.readUsername().then((value) {
          setState(() {
            username = value;
            _controllerUsername.text = value;
          });
        });

        SharedPreferencesHelper.readPassword().then((value) {
          setState(() {
            password = value;
            _controllerPassword.text = value;
          });
        });
      }
    });
  }

  void validateLogin(BuildContext _context) {
    if (_controllerUsername.value.text.length == 0) {
      //belum input
      showAlert(_context, "Warning!", "Anda belum mengisi username!");
    } else if (_controllerPassword.value.text.length == 0) {
      showAlert(_context, "Warning!", "Anda belum mengisi password");
    } else {
      //sudah input semua
      SharedPreferencesHelper.saveIsLogin(true);
      SharedPreferencesHelper.saveUsername(username);
      SharedPreferencesHelper.savePassword(password);
      SharedPreferencesHelper.saveIsRemember(isRememberMe);
      //pindah ke screen dashboard
      ruteDashboardScreen(context);
    }
  }

  void showAlert(BuildContext _context, String _title, String _message) {
    var alertDialog =
        CustomAlertDialog(title: _title, message: _message, action_text: "OK");
    showDialog(context: _context, builder: (_) => alertDialog);
  }

  void pindahKeRegisterScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return RegisterScreen();
        },
      ),
    );
  }

  void ruteRegisterScreen(BuildContext context) {
    Route _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            RegisterScreen(),
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

    Navigator.of(context).push(ScaleRoute(page: RegisterScreen()));
  }

  void ruteDashboardScreen(BuildContext context) {
    Route _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            DashboardScreen(),
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

    Navigator.of(context).pushReplacement(ScaleRoute(page: DashboardScreen()));
  }
}

// TextButton(
// child: Text("Login Now!"),
// style: ButtonStyle(
// backgroundColor:
// MaterialStateProperty.all<Color>(Colors.black12),
// overlayColor: MaterialStateProperty.resolveWith<Color>(
// (Set<MaterialState> states) {
// if (states.contains(MaterialState.focused))
// return Colors.lightBlue;
// if (states.contains(MaterialState.hovered))
// return Colors.blueAccent;
// if (states.contains(MaterialState.pressed))
// return Colors.blue[50];
// }),
// ),
// onPressed: () {
// FocusScope.of(context).unfocus();
// validateLogin(context);
// },
// ),
