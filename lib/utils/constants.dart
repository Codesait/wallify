import 'package:flutter/material.dart';

fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

fullHeigth(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
class UtilClass {
  Color primaryColor = Colors.green;

  TextStyle boldLogoText = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 45);


}