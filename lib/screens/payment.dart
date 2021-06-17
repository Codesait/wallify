import 'package:flutter/material.dart';
import 'package:wallify/utils/constants.dart';

class Payment extends StatefulWidget {
  const Payment({Key key,this.amount}) : super(key: key);
  final String amount;

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
         height: fullHeigth(context),
        width: fullWidth(context),
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 50,),
              _amountArea(amount: widget.amount),
              SizedBox(height: 100,),
              _paymentMethodArea()
            ],
          ),
    );
  }

  Widget _amountArea({String amount}){
    return Container(
      width: fullWidth(context),
      height: fullHeigth(context)/5.5,
      padding: const EdgeInsets.all(12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            maxLines: 1,
            text: TextSpan(children: [

              TextSpan(
                  text: r'$ ',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w400)),
              TextSpan(
                  text: amount == '' ? '0.00': amount ,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 39
                  )),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: fullWidth(context)/1.5,
                  child: Divider()),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                child: CircleAvatar(
                  radius: 19,
                  backgroundColor: Colors.grey[200],
                  child: IconButton(
                    onPressed: (){

                    },
                    icon: Icon(
                      Icons.compare_arrows_rounded,
                    ),
                    iconSize: 20,
                    color: Colors.black,
                  ),

                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Balance: ', style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
              Text(r'$150.00 ', style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)

            ],
          )
        ],
      ),
    );
  }

  Widget _paymentMethodArea(){
    return Container(
      width: fullWidth(context),
      height: fullHeigth(context)/2.5,
      padding: const EdgeInsets.all(12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
      ),
    );
  }
}
