import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';

class Parsing1 extends StatefulWidget {
  @override
  _Parsing1State createState() => _Parsing1State();
}

class _Parsing1State extends State<Parsing1>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  int responseCode = 0;
  String json100posts = "";

  ProgressDialog loading;
  @override
  Widget build(BuildContext context) {
    loading = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);
    loading.style(
      message: "Mohon tunggu....",
      messageTextStyle:
          TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      progressWidget: CircularProgressIndicator.adaptive(),
      borderRadius: 15.0,
      elevation: 15.0,
      insetAnimCurve: Curves.easeInOutBack,
      backgroundColor: Colors.white38,
    );
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/yonkou.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Material(
            color: Colors.white38,
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: TextButton(
              style: ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                get100posts();
              },
              child: Text(
                "Get 100 Posts",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("HTTP Response Code = $responseCode"),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [Text("$json100posts")],
            ),
          ),
        ],
      ),
    );
  }

  //metode panggil API
  Future<String> get100posts() async {
    await loading.show();
    final String urlAPI = "https://jsonplaceholder.typicode.com/posts";

    var request = await http.get(Uri.parse(urlAPI), headers: {
      "X-Requested-With": "XMLHttpRequest",
      "Content-Type": "application/json"
    });

    var response = request.body;
    setState(() {
      responseCode = request.statusCode;
      json100posts = request.body;

      //tutup loading
      loading.hide();
    });
  }
}
