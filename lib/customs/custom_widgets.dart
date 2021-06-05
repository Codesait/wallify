import 'package:flutter/material.dart';
import 'package:wallify/utils/constants.dart';
import 'package:wallify/utils/extensions.dart';

final UtilClass _utilClass = UtilClass();

//
// home screen widgets

// custom bar
Widget customAppBar(BuildContext context){
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
Widget banner(BuildContext context){
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
Widget features(BuildContext context){
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
                childAspectRatio: 5 / 7,
                crossAxisSpacing: 25,
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
    borderRadius: BorderRadius.circular(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 55,
          width: 55,
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
              color: Color(color).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16)
          ),
          child: Image.asset(imageIcon + '.png',height: 20,width: 20,),
        ),

        Text(title,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500),)
      ],
    ),
  );
}

Widget promo(BuildContext context){
  return Container(
    padding: const EdgeInsets.only(top: 25),
    width: fullWidth(context),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Special Promos',style: TextStyle(
                fontSize:18,
                fontWeight: FontWeight.bold
            ),),
            Text('See All',style: TextStyle(
                fontSize:15,
                fontWeight: FontWeight.normal,
                color: Colors.grey
            ),),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _utilClass.promos.map((e) => promoWidget(
            context,
            title: e["title"],
            thumbnail: e["thumbnail"],
            description: e["description"]
          )).toList(),
        )
      ],
    ),
  );
}


Widget promoWidget(BuildContext context,{String thumbnail, String title, String description} ){
  return Container(
    padding: const EdgeInsets.only(),
    height: 170,
    width: fullWidth(context)/2.3,
    child: Column(
      children: [
        Expanded(
          flex: 2,
            child: Image.asset(thumbnail.jpeg,fit: BoxFit.fill, width: fullWidth(context)/2.3),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 15),
              SizedBox(
                width: 140,
                  child: Text(description))
            ],
          ),
        )
        
      ],
    ),
  );
}
//
//
