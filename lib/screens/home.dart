
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
              _banner(context),
              _features(context)
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
          fit: BoxFit.cover,
          image: AssetImage(
            'banner'.jpeg,

          )
        )
      ),
    );
  }

  //features
  Widget _features(BuildContext context){
    return Container(
      padding: const EdgeInsets.only(top: 25),
      width: fullWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Features',style: TextStyle(
            fontSize:18,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 20,),
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 4 / 5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 25),
              shrinkWrap: true,
              itemCount: _utilClass.featureData.length,
              itemBuilder: (BuildContext context, index){
                return _featureWidget(
                  title: _utilClass.featureData[index]["title"],
                  imageIcon: _utilClass.featureData[index]["icon"],
                  color: _utilClass.featureData[index]["backgroundColor"],
                  routName: _utilClass.featureData[index]["route"]
                );
              })
        ],
      ),
    );
  }

  Widget _featureWidget({String title, String imageIcon, int color, String routName}){
    return InkWell(
      onTap: (){},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 55,
            width: 55,
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Color(color).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16)
            ),
            child: Image.asset(imageIcon + '.png',height: 20,width: 20,),
          ),

          Text(title)
        ],
      ),
    );
  }


}
