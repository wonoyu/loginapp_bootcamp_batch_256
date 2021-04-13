import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tabbarview/parsing1.dart';
import 'tabbarview/parsing2.dart';
import 'tabbarview/parsing3.dart';

class ParsingDataScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ParsingDataScreenState();
}

class ParsingDataScreenState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent,
            title: Text("Parsing Data"),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.data_usage),
                  text: "JSON 1",
                ),
                Tab(icon: Icon(Icons.data_usage_rounded), text: "JSON 2"),
                Tab(
                    icon: Icon(Icons.signal_cellular_alt_rounded),
                    text: "REQRES"),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[Parsing1(), Parsing2(), Parsing3()],
          ),
        ),
      ),
    );
  }
}
