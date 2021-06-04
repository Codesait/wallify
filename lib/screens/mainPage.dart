
import 'package:flutter/material.dart';
import 'package:wallify/model/bottom_navigation.dart';
import 'package:wallify/screens/home.dart';
import 'package:wallify/utils/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
 int  currentIndex = 0;
 UtilClass utilClass = UtilClass();

 // listing the bottom nav icons
 List<Nav> navIcons = [
   Nav(index: 0 ,icon: Icons.apps_rounded),
   Nav(index: 1 ,icon: Icons.qr_code_scanner_rounded),
   Nav(index: 2 ,icon: Icons.person),
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getCurrentPage(),
      bottomNavigationBar: _bottomNavigation(),
    );
  }

  Widget getCurrentPage(){
    switch(currentIndex) {
      case 0 :
        return HomeScreen();
      case 1 :
        return Container();
      case 2:
        return Container();
    }
    return getCurrentPage();
  }


  Widget _bottomNavigation(){
    return Container(
      padding: EdgeInsets.only(top: 2.0),
      height: 75,
      decoration: BoxDecoration(color: Colors.white,),
      width: fullWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          for (var i = 0; i < navIcons.length; i++)
            if (navIcons[i].index == currentIndex)
              getActiveButton(navIcons[i])
            else
              getInactiveButton(navIcons[i])
        ],
      ),
    );
  }

  Widget getActiveButton(Nav tab) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: utilClass.primaryColor,
      child: Icon(
        tab.icon,
        color: Colors.white,
      ),
    );
  }

  Widget getInactiveButton(Nav tab) {
    return InkWell(
      onTap: () => setState(() {
        currentIndex = tab.index;
      }),
      child: Container(
        padding: EdgeInsets.only(top: 2),
        height: 69,
        width: 50.0,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Icon(tab.icon, color: Colors.grey[400]),
            ),

          ],
        ),
      ),
    );
  }
}
