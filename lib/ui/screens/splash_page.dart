import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Splash();
  }
}

class _Splash extends State {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () => _navigateToDashboard(context));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height,
          left: (MediaQuery.of(context).size.width / 7),
          child: Image(
            image: AssetImage("res/images/icon_netflix.png"),
            width: 300,
            height: 300,
          ),
        ),
      ],
    ));
  }

  _navigateToDashboard(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
        (Route<dynamic> route) => false);
  }
}
