import 'package:batch_256/views/menu/parsingdata.dart';
import 'package:batch_256/views/transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BouncingButton extends StatefulWidget {
  @override
  BouncingButtonState createState() => BouncingButtonState();
}

class BouncingButtonState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: GestureDetector(
              onTapDown: _tapDown,
              onTapUp: _tapUp,
              child: Transform.scale(
                scale: _scale,
                child: _animatedButton(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _animatedButton() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x80000000),
              blurRadius: 12.0,
              offset: Offset(0.0, 5.0),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff33ccff),
              Color(0xffff99cc),
            ],
          )),
      child: Center(
        child: InkWell(
          child: Column(
            children: [
              Icon(
                CupertinoIcons.archivebox,
                color: Colors.white,
                size: 100,
              ),
              Text(
                'Parsing Data',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          onTap: () {
            Navigator.push(context, ScaleRoute(page: ParsingDataScreen()));
          },
        ),
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
