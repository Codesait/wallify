import 'package:flutter/material.dart';
import 'package:wallify/customs/button.dart';
import 'package:wallify/intro/carousel.dart';
import 'package:wallify/utils/constants.dart';

class Intro extends StatefulWidget {
  const Intro({Key key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  UtilClass _utilClass = UtilClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Container(
                color: Colors.white,
              )),
              Expanded(flex: 4, child: Carousel()),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Button(
                        colors: _utilClass.primaryColor,
                        onclick: (){},
                        height: 50,
                        width: 150,
                        child: Text('Get Started'),
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
