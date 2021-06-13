import 'package:flutter/material.dart';
import 'package:wallify/customs/custom_widgets.dart';
class TopUp extends StatefulWidget {
  const TopUp({Key key}) : super(key: key);

  @override
  _TopUpState createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            topUpAppBar(),
            topUpAmount(context),
            Expanded(
              flex: 5,
                child: Container(
                  color: Colors.grey,

                ))
          ],
        ),
      ),
    );
  }
}
