import 'package:flutter/material.dart';
import 'package:wallify/utils/constants.dart';

class More extends StatelessWidget {
   More({Key key}) : super(key: key);

  final _utilClass = UtilClass();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: fullHeigth(context),
      width: fullWidth(context),
      color: Colors.transparent,
      child: Column(
        children: [

          Expanded(
            flex: 4,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Column(
                  children: [
                    _grid(),
                    Container(
                      height: 53,
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Colors.grey[200]
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.purple,
                            child: Icon(Icons.call_split_rounded,color: Colors.white,),
                          ),
                          SizedBox(width: 6.0,),
                          Text("Convert", style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),)
                        ],
                      ),
                    )
                  ],
                )

              )
          ),

          Expanded(
            flex: 1,
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _closeModal(context)
                  ],
                ),
              )
          )
        ],
      ),
    );
  }

  Widget _closeModal(BuildContext context){
    return CircleAvatar(
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
    );
  }

  Widget _grid(){
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.5,
            crossAxisSpacing: 25,
            mainAxisSpacing: 25),

        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _utilClass.moreFeatures.length,
        itemBuilder: (BuildContext context, index){
          return _gridItem(
            color: _utilClass.moreFeatures[index]["backgroundColor"],
            icon: _utilClass.moreFeatures[index]["icon"],
            title: _utilClass.moreFeatures[index]["title"]
          );
        });
  }

  Widget _gridItem({int color, String title, IconData icon}){
    return Container(
      height: 25,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey[200]
        )
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Color(color),
            child: Icon(icon,color: Colors.white,),
          ),
          SizedBox(width: 6.0,),
          Text(title, style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }

}
