import 'package:flutter/material.dart';
import 'package:wallify/customs/custom_widgets.dart';
import 'package:wallify/utils/constants.dart';

class HomeScreen extends StatelessWidget {

   HomeScreen({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        height: fullHeigth(context),
        width: fullWidth(context),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                customAppBar(context),
                banner(context),
                features(context),
                promo(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
