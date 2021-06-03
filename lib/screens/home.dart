import 'package:flutter/material.dart';
import 'package:wallify/utils/constants.dart';
import 'package:wallify/utils/extensions.dart';

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
          child: Column(
            children: [
              _customAppBar(context),
              _banner(context)
            ],
          ),
        ),
      ),
    );
  }

  UtilClass _utilClass = UtilClass();

  // custom bar
  Widget _customAppBar(BuildContext context){
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      width: fullWidth(context),
      // height: fullHeigth(context)/1.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23
                ),
              ),
              Text(
                'John Wick',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 16
                ),
              ),
            ],
          ),

          Container(
            height: 30,
            width: 30,
            child: Stack(
              children:[
                CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.red,
                ),
                IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: (){}
                ),
              ]
            ),
          )

        ],
      ),
    );
  }

  // banner
  Widget _banner(BuildContext context){
    return Container(
      height: 130,
      width: fullWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(23.0)),
        color: _utilClass.primaryColor,
        image: DecorationImage(
          image: AssetImage(
            'memoji'.png,

          )
        )
      ),
    );
  }

  //features
  Widget _features(BuildContext contex){
    return Container(
      child: Column(

      ),
    );
  }


}
