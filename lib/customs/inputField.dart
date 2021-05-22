import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.controller,
    this.prefixIcon,
    this.inputType,
    this.padding,
    this.focusNode
  });

  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;
  final TextEditingController controller;
  final TextInputType inputType;
  final Widget prefixIcon;
  final EdgeInsets padding ;
  final FocusNode focusNode;

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      child: TextFormField(
          controller: widget.controller,
          onSaved: widget.onSaved,
          validator: widget.validator,
          onFieldSubmitted: widget.onFieldSubmitted,
          keyboardType: widget.inputType,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          focusNode: widget.focusNode,
          decoration: InputDecoration(
            enabled: true,
            border: const UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Colors.white,
                width: 1.0,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
            filled: true,
            fillColor: Colors.transparent,
            hintText: widget.hintText,
            labelText: widget.labelText,
            helperText: widget.helperText,
            hintStyle: TextStyle(color: Colors.white),
            labelStyle: TextStyle(
              color: Colors.white
            ),
            prefixIcon: widget.prefixIcon,

          )),
    );
  }
}
