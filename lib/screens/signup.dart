import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:wallify/customs/button.dart';
import 'package:wallify/customs/inputField.dart';
import 'package:wallify/customs/passwordInputField.dart';
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

  final _focusNodeEmail = FocusNode();
  final _focusNodePassword = FocusNode();
  final _focusNodePhone = FocusNode();

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
                  SizedBox(height: 30,),
                  Text(
                    'Wallify',
                    style: _utilClass.boldLogoText,
                  ),
                  _fullName(context: context),
                  _email(context: context),
                  _password(context: context),
                  _phoneField(context: context),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Button(
                      height: 50,
                      width: 200,
                      child: Text('Continue'),
                      colors: Colors.black,
                      onclick: (){

                      },
                    ),
                  )


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
      onFieldSubmitted: (_)=> FocusScope.of(context).requestFocus(_focusNodeEmail)

    );
  }

  Widget _email({BuildContext context}){
    return InputField(
      padding: const EdgeInsets.all(10),
      labelText: "Email",
      controller: _emailController,
      onFieldSubmitted: (_)=> FocusScope.of(context).requestFocus(_focusNodePassword),
      focusNode: _focusNodeEmail,

    );
  }

  Widget _password({BuildContext context}){
    return PasswordField(
      padding: const EdgeInsets.all(10),
      labelText: "Password",
      controller: _passwordController,
      onFieldSubmitted: (_)=> FocusScope.of(context).requestFocus(_focusNodePhone),
      focusNode: _focusNodePassword,

    );
  }

  Widget _phone({BuildContext context}){
    return InputField(
      padding: const EdgeInsets.all(10),
      labelText: "Enter Phone Number",
      controller: _phoneController,
      onFieldSubmitted: (_)=> FocusScope.of(context).requestFocus(_focusNodePassword),
      focusNode: _focusNodePhone,

    );
  }

  Widget _phoneField({BuildContext context}) {
    return  Container(
      width: fullWidth(context),
      height: 120,
      child: Row(
        children:[
          SizedBox(
            height: 60,
            width: fullWidth(context)/3,
            child: CountryCodePicker(
              onChanged: print,
              initialSelection: 'IT',
              favorite: ['+39','FR'],
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              // optional. aligns the flag and the Text left
              // alignLeft: false,
            ),
          ),
          SizedBox(
            height: 100,
              width: fullWidth(context)/1.7,
              child: _phone(context: context)),
        ],
      ),
    );
  }
}
