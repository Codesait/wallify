import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:wallify/utils/constants.dart';

class PhoneVerificaton extends StatefulWidget {
  const PhoneVerificaton({Key key}) : super(key: key);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}


class _PhoneVerificationState extends State<PhoneVerificaton> {
 UtilClass _utilClass = UtilClass();

  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  children: [

                  ],
                ),
              )),
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

  Widget _numericKeypad(){
    return NumericKeyboard(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      onKeyboardTap: (val)=> _onKeyTap(val),
      textColor: Colors.white,
      rightIcon: Icon(Icons.clear,color: Colors.white,),
      rightButtonFn: () => _onClear(),
    );
  }

  void _onKeyTap(String val) async {
    inputController.text = inputController.text + val;
    print('val: $val');
    print("input: " + inputController.text);
  }

  void _onClear() async {
    if (inputController.text.length > 0) {
      inputController.text = inputController.text
          .substring(0, inputController.text.length - 1);
      print(inputController.text);
    }
  }
}
