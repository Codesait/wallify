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

  List<Map> featureData =[
    {
      "title": "Top Up",
      "icon": "assets/images/top_up",
      "backgroundColor": 0xFFe942f5,
      "route": "/topUp"
    },
    {
      "title": "Transfer",
      "icon": "assets/images/send",
      "backgroundColor": 0xFFe0c02f,
      "route": "/topUp"
    },
    {
      "title": "Internet",
      "icon": "assets/images/internet",
      "backgroundColor": 0xFF388E3C,
      "route": "/topUp"
    },
    {
      "title": "Wallet",
      "icon": "assets/images/wallet",
      "backgroundColor": 0xFFf03743,
      "route": "/topUp"
    },
    {
      "title": "Bill",
      "icon": "assets/images/invoice",
      "backgroundColor": 0xFFe0c02f,
      "route": "/topUp"
    },
    {
      "title": "Game",
      "icon": "assets/images/video_game",
      "backgroundColor": 0xFF388E3C,
      "route": "/topUp"
    },
    {
      "title": "Mobile Prepaid",
      "icon": "assets/images/smartphone",
      "backgroundColor": 0xFFf03743,
      "route": "/topUp"
    },
    {
      "title": "More",
      "icon": "assets/images/more",
      "backgroundColor": 0xFFe942f5,
      "route": "/topUp"
    },
  ];


}