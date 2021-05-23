import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.maxLength,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.controller,
    this.inputType,
    this.focusNode,
    this.padding
  });

  final Key fieldKey;
  final int maxLength;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;
  final TextEditingController controller;
  final TextInputType inputType;
  final FocusNode focusNode;
  final EdgeInsets padding;


  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      child: TextFormField(
          controller: widget.controller,
          key: widget.fieldKey,
          obscureText: _obscureText,
          // maxLength: widget.maxLength ?? 9, // if not provided by the user, then it is 8
          onSaved: widget.onSaved,
          validator: widget.validator,
          keyboardType: widget.inputType,
          onFieldSubmitted: widget.onFieldSubmitted,
          focusNode: widget.focusNode,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            filled: true,
            fillColor: Colors.transparent,
            hintText: widget.hintText,
            labelText: widget.labelText,
            helperText: widget.helperText,
            labelStyle: TextStyle(color: Colors.white),
            hintStyle: TextStyle(color: Colors.white),
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
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility,color: Colors.white,),
            ),

          )),
    );
  }
}


