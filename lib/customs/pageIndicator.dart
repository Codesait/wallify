import 'package:flutter/material.dart';
import 'package:wallify/utils/constants.dart';

class PageIndicator extends StatelessWidget {
  final bool isActive;
  PageIndicator(this.isActive);

  @override
  Widget build(BuildContext context) {
    UtilClass _util = UtilClass();
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 1.0),
      height: 7.0,
      width: isActive ? 29.0 : 7.0,
      decoration: BoxDecoration(
        color: isActive ? _util.primaryColor : Colors.grey[400],
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
