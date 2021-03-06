import 'package:flutter/material.dart';
import 'package:wallify/customs/appBar.dart';
import 'package:wallify/customs/custom_widgets.dart';

class Profile extends StatefulWidget {
  const Profile({Key key,this.title}) : super(key: key);
  final String title;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _onValueChange;
  bool _isPriceVisible = true;

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
                      isVisible: _isPriceVisible,
                      isPriceVisible: (){
                        setState(() {
                          _isPriceVisible == true ? _isPriceVisible = false : _isPriceVisible = true;
                        });
                      },
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
