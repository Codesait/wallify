import 'package:flutter/material.dart';
import 'package:wallify/utils/constants.dart';

class More extends StatelessWidget {
  const More({Key key}) : super(key: key);

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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)
                ),

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

}
