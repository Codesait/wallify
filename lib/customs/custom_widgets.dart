import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wallify/screens/more.dart';
import 'package:wallify/screens/topUpScreen.dart';
import 'package:wallify/utils/constants.dart';
import 'package:wallify/utils/extensions.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

import 'button.dart';

final UtilClass _utilClass = UtilClass();

//
// home screen widgets
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
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  fontSize: 16
              ),
            ),
          ],
        ),

        Container(
          padding: const EdgeInsets.all(8),
          height: 30,
          width: 30,
          child: Stack(
            fit: StackFit.loose,
              children:[
                Expanded(
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.red,
                  ),
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

Widget features(BuildContext context){
  final modalClass = Modal(context: context);
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
            physics: NeverScrollableScrollPhysics(),
            itemCount: _utilClass.featureData.length,
            itemBuilder: (BuildContext context, index){
              return _featureWidget(
                  title: _utilClass.featureData[index]["title"],
                  imageIcon: _utilClass.featureData[index]["icon"],
                  color: _utilClass.featureData[index]["backgroundColor"],
                  routName: _utilClass.featureData[index]["route"],
                onTap: (){
                    print(index);
                    if(index == 7){
                      modalClass.showModal();
                    }
                }
              );
            })
      ],
    ),
  );
}


Widget _featureWidget({String title, String imageIcon, int color, String routName, VoidCallback onTap}){
  return InkWell(
    onTap: onTap,
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

        Text(title,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 13),)
      ],
    ),
  );
}

class Modal {
  BuildContext context;

  Modal({ @required this.context});

  void showModal() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: false,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: MoreWidget(),
          );
        });
  }
}

//
// promo widgets
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
// profile page widgets
Widget profileBanner(BuildContext context,{Function isPriceVisible, bool isVisible,String dropDownHint, Function onDropDownChange,String item}) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: const EdgeInsets.all(20),
    padding: const EdgeInsets.all(22),
    height: 120,
    width: fullWidth(context),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(23.0)),
        color: Colors.grey[100],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Balance',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 19.0
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                RichText(
                  maxLines: 2,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: r'$ ',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                    TextSpan(
                        text: isVisible ? '150.00' : '*** **',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 29
                        )),
                  ]),
                ),
                IconButton(
                    icon: Icon(isVisible ? Icons.visibility_rounded : Icons.visibility_off_rounded),
                    color: Colors.grey,
                    onPressed: isPriceVisible,
                )
              ],
            ),
            Container(
              height: 32,
              width: 74,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: _utilClass.purple
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: item,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  style: TextStyle(
                    color: Colors.white
                  ),
                  hint: Text(
                    dropDownHint,
                    style: TextStyle(color: Colors.white),
                  ),
                  items: <String>[
                    'USD',
                    'NGN',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                    );
                  }).toList(),
                  dropdownColor: Colors.deepPurple,
                  onChanged: onDropDownChange,
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Widget history(BuildContext context){
  return Container(
    width: fullWidth(context),
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Transactions',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(2),
              onTap: (){},
                child: Text(
                  'View all',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                )),
          ],
        ),
        Container(
          width: fullWidth(context),
          height: 350,
          child: ListView(
            children: _utilClass.dummyTransactions.map((e) =>
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: historyTile(
                      date: e['date'],
                      title: e['title'],
                      price: e['price'],
                      thumbnail: e['thumbnail']
                  ),
                )
            ).toList(),
          ),
        ),
        topUpBtn(context)
      ],
    ),
  );
}
Widget historyTile({String date, String thumbnail, String title, String price}){
  return ListTile(
    onTap: (){},
    leading: Text(date,style: TextStyle(color: _utilClass.primaryColor,fontSize: 15,fontWeight: FontWeight.bold)),
    title: Row(
      children: [
        SizedBox(width: 10),
        Image.asset(
          thumbnail.png,
          height: 25,
          width: 25,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title,style: TextStyle(fontSize: 14),),
            Text(price,style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),)

          ],
        )

      ],
    ),
    trailing: Icon(Icons.keyboard_arrow_right),
  );
}

Widget topUpBtn(BuildContext context){
  return  Container(
    height: 48,
    width: fullWidth(context),
    child: InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TopUp())),
      child: Center(child: Text('Top Up',
        style: TextStyle(color: _utilClass.primaryColor,fontWeight: FontWeight.bold,fontSize: 18)
      )),
    ),
    decoration: BoxDecoration(
      color: _utilClass.primaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(10)
    ),
    
  );
}

//
/// top up widgets
Widget topUpAppBar(BuildContext context){
  return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                radius: 19,
                backgroundColor: Colors.grey[200],
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.clear,
                  ),
                  iconSize: 20,
                  color: Colors.black,
                ),

              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxHeight: 48.0,
                maxWidth: 90.0,
                minHeight: 39.0,
                minWidth: 85.0
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25)
              ),
              alignment: Alignment.center,
              child: Text(
                'Top Up',
                style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),

              ),
            ),
            SizedBox(width: 50,)
          ],
        ),
      ));
}

Widget topUpAmount(BuildContext context,{String amount}){
  return Expanded(flex: 2,
      child: Container(
        alignment: Alignment.center,
        width: fullWidth(context),
        color: Colors.white,
        child: Container(
          height: 100,
          alignment: Alignment.center,
          constraints: BoxConstraints(
            minWidth: 100.0,
            maxWidth: 250.0
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                maxLines: 1,
                text: TextSpan(children: [

                  TextSpan(
                      text: r'$ ',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: amount == '' ? '0.00': amount ,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 39
                      )),
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Balance: ', style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                  Text(r'$150.00 ', style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)

                ],
              )
            ],
          ),
        ),

      ));
}






