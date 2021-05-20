import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wallify/screens/intro.dart';
import 'package:wallify/utils/constants.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  UtilClass utils = UtilClass();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  // navigate after time elapse
  void startTimer(){
    Timer(Duration(seconds: 4), navigate);
  }

  // navigate to a new page
  void navigate(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Intro()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 150,
          child: Text(
            'Wallify',
            style: TextStyle(
                color: utils.primaryColor,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
