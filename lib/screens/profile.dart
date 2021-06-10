import 'package:flutter/material.dart';
import 'package:wallify/customs/appBar.dart';
import 'package:wallify/customs/custom_widgets.dart';
import 'package:wallify/utils/constants.dart';

class Profile extends StatefulWidget {
  const Profile({Key key,this.title}) : super(key: key);
  final String title;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _onValueChange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: CustomAppBar(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: CustomAppBar(title: widget.title,),
            ),
            Expanded(
              flex: 9,
                child: Column(
                  children: [
                    profileBanner(
                      context,
                      dropDownHint: 'USD',
                      item: _onValueChange,
                      onDropDownChange: (v){
                        setState(() {
                          _onValueChange = v;
                          print(v);
                        });
                      }
                    ),
                    history(context)


                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
