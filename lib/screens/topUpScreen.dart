import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wallify/customs/button.dart';
import 'package:wallify/customs/custom_widgets.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:wallify/screens/payment.dart';
import 'package:wallify/utils/constants.dart';
class TopUp extends StatefulWidget {
  const TopUp({Key key}) : super(key: key);

  @override
  _TopUpState createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  String _topUpAmount = '';
  int _amount;
  String _formatAmount = '0';
  final formatter = NumberFormat("#,###");
  final hundredsFormat = NumberFormat("###");

  UtilClass _utilClass = UtilClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            topUpAppBar(context),
            topUpAmount(context, amount: _formatAmount),
            Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.center,
                  width: fullWidth(context),
                  color: Colors.white,
                  child: Column(
                    children: [
                      topUpKeyPad(),
                      SizedBox(height: 20,),
                      Button(
                        height: 50.0,
                        width: fullWidth(context) / 1.2,
                        onclick: () => showModal(),
                        child: Text(
                          'Continue', style: TextStyle(fontSize: 18),),
                        color: _utilClass.primaryColor,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget topUpKeyPad() {
    return NumericKeyboard(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      _amount = int.parse(_topUpAmount);
      _formatAmount = formatter.format(_amount);
    });
    print("input: " + _amount.toString());
    print("length: " +_formatAmount.length.toString());

  }

  // on clear button tapped
  // checking if input is not empty
  void _onClear() async {
    if (_formatAmount.length > 1) {
      setState(() {
        if( _formatAmount.length == 3){
          _topUpAmount = hundredsFormat.format(_amount);
        }

        _topUpAmount = _topUpAmount.substring(0, _topUpAmount.length - 1);
        _amount = int.parse(_topUpAmount);
        _formatAmount = formatter.format(_amount);
        print(_topUpAmount);
        print("length: " +_formatAmount.length.toString());
      });
    } else if(_formatAmount.length == 1) {
      setState(() {
       _topUpAmount  = "0";
      _amount = int.parse(_topUpAmount);
      _formatAmount = formatter.format(_amount);
    });
    }
  }

  void showModal() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) {
          return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Payment(amount: _topUpAmount,)
          );
        });
  }

}
