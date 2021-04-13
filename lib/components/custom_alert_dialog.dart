import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String action_text;
  final Color dialog_color = Colors.white;

  const CustomAlertDialog({
    this.title,
    this.message,
    this.action_text,
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
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              action_text,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ))
      ],
    );
  }
}
