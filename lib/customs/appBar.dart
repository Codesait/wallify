import'package:flutter/material.dart';
import 'package:wallify/utils/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key key,this.title}) : super(key: key);
  final String title;




  @override
  Widget build(BuildContext context) {
   final UtilClass utilClass = UtilClass();
    return Container(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title,
            style: TextStyle(
                color: utilClass.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          )
        ],
      ),
    );
  }
}
