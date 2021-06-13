import 'package:flutter/material.dart';

class Button extends StatefulWidget {

  const Button({
    this.height,
    this.width,
    this.color,
    this.onclick,
    this.text,
    this.child
  });

  final double height;
  final double width;
  final Color color;
  final String text;
  final VoidCallback onclick;
  final Widget child;
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {



  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height:widget.height,
      width: widget.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: widget.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: widget.onclick,
        child: widget.child,
      ),
    );
  }
}

