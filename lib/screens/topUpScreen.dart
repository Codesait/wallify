import 'package:flutter/material.dart';
import 'package:wallify/customs/custom_widgets.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:wallify/utils/constants.dart';
class TopUp extends StatefulWidget {
  const TopUp({Key key}) : super(key: key);

  @override
  _TopUpState createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  String _topUpAmount = '' ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            topUpAppBar(context),
            topUpAmount(context,amount: _topUpAmount),
            Expanded(
              flex: 4,
                child: Container(
                  alignment: Alignment.center,
                  width: fullWidth(context),
                  color: Colors.white,
                  child: topUpKeyPad(),
                ))
          ],
        ),
      ),
    );
  }

  Widget topUpKeyPad(){
    return NumericKeyboard(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      onKeyboardTap: (val) => _onKeyTap(val),
      textColor: Colors.black,
      rightIcon: Icon(
        Icons.clear,
        color: Colors.black,
      ),
      rightButtonFn: () => _onClear(),
    );
  }

  // on number tapped function
  void _onKeyTap(String val) async {
    setState(() {
      _topUpAmount = _topUpAmount + val;
    });
    print("input: " + _topUpAmount);
  }

  // on clear button tapped
  // checking if input is not empty
  void _onClear() async {
    if (_topUpAmount.length > 0) {
     setState(() {
       _topUpAmount =
           _topUpAmount.substring(0, _topUpAmount.length - 1);
       print(_topUpAmount);
     });
    }
  }
}
