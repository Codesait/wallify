import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:wallify/utils/constants.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({Key key}) : super(key: key);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}


class _PhoneVerificationState extends State<PhoneVerification> {
  UtilClass _utilClass = UtilClass();

  TextEditingController inputController = TextEditingController();
  FocusNode inputFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: _utilClass.primaryColor),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('OTP Verification',style: TextStyle(color: _utilClass.primaryColor),),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
              flex: 2,
              child: _inputArea()
          ),
          Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                width: fullWidth(context),
                decoration: BoxDecoration(
                    color: _utilClass.primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0))),
                child: _numericKeypad(),
              ))
        ],
      ),
    );
  }

 

  // input area
  Widget _inputArea(){
    return Container(
      padding: const EdgeInsets.all(30.0),
      width: fullWidth(context),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Please Enter\nOTP Verification',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900
            ),
          ),
          Text(
            'Code sent to 081 123 45***',
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.normal
            ),
          ),
          RichText(
            maxLines: 2,
            text: TextSpan(
                children: <TextSpan>[
                  TextSpan(text: 'This code will expire in ',style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal
                  )),
                  TextSpan(text: '02.28',style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold
                  )),
                ]
            ),
          ),
          _pinInput(),
          Container(
            padding: const EdgeInsets.all(25),
            alignment: Alignment.center,
            width: fullWidth(context),
            child:
            InkWell(
              child: Text('Resend OTP',
                style: TextStyle(color: _utilClass.primaryColor),
              ),
              onTap: (){print('resent');},
            ),
          )
        ],
      ),
    );
  }
  
  Widget _pinInput(){
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: const Color.fromRGBO(235, 236, 237, 1),
      borderRadius: BorderRadius.circular(10.0),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 35),
      child: PinPut(
        fieldsCount: 4,
        withCursor: true,
        useNativeKeyboard: false,
        textStyle: const TextStyle(fontSize: 25.0, color: Colors.black,fontWeight: FontWeight.bold),
        eachFieldWidth: 55.0,
        eachFieldHeight: 55.0,
        onSubmit: (String pin) => {print('$pin')},
        focusNode: inputFocusNode,
        controller: inputController,
        submittedFieldDecoration: pinPutDecoration,
        selectedFieldDecoration: pinPutDecoration,
        followingFieldDecoration: pinPutDecoration,
        pinAnimationType: PinAnimationType.fade,
      ),
    );
  }

  Widget _numericKeypad(){
    return NumericKeyboard(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      onKeyboardTap: (val)=> _onKeyTap(val),
      textColor: Colors.white,
      rightIcon: Icon(Icons.clear,color: Colors.white,),
      rightButtonFn: () => _onClear(),
    );
  }


  // on number tapped function
  void _onKeyTap(String val) async {
    inputController.text = inputController.text + val;
    print("input: " + inputController.text);
  }

  // on clear button tapped
 // checking if input is not empty
  void _onClear() async {
    if (inputController.text.length > 0) {
      inputController.text = inputController.text
          .substring(0, inputController.text.length - 1);
      print(inputController.text);
    }
  }
}
