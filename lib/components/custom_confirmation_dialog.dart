import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String yes;
  final String no;
  final Function pressYes, pressNo;
  final Color dialog_color = Colors.white;

  const CustomConfirmationDialog({
    this.title,
    this.message,
    this.yes,
    this.no,
    this.pressYes,
    this.pressNo,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      backgroundColor: dialog_color,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        fontFamily: 'BiomeRegular',
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: 'BiomeRegular',
      ),
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
      actions: <Widget>[
        new TextButton(
          onPressed: pressNo,
          child: Text(
            no,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        new TextButton(
          onPressed: pressYes,
          child: Text(
            yes,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
