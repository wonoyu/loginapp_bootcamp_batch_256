import 'package:flutter/material.dart';

Widget customSnackBar(String message) => SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.black87, fontSize: 16),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.white12,
    );

Widget customSnackBarWithTitle(String title, String message) => SnackBar(
      content: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(children: <TextSpan>[
          TextSpan(
              text: title + "\n",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
          TextSpan(
              text: message,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              )),
        ]),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.white12,
    );
