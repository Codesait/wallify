import 'package:flutter/material.dart';
import 'package:wallify/customs/inputField.dart';
import 'package:wallify/utils/constants.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  final _focusNode = FocusNode();
  UtilClass _utilClass = UtilClass();

  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _utilClass.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: fullWidth(context),
            height: fullHeigth(context),
            child: Form(
              key: _fromKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget>[
                  Text(
                    'Wallify',
                    style: _utilClass.boldLogoText,
                  ),
                  _fullName(context: context),
                  _email(),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _fullName({BuildContext context}){
    return InputField(
      padding: const EdgeInsets.all(10),
      labelText: "Full Name",
      controller: _fullNameController,
      onFieldSubmitted: (v){
        FocusScope.of(context).requestFocus(_focusNode);
      },
    );
  }

  Widget _email({BuildContext context}){
    return InputField(
      padding: const EdgeInsets.all(10),
      labelText: "Email",
      controller: _emailController,
      focusNode: _focusNode,

    );
  }
}
