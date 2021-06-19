import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wallify/utils/constants.dart';
import 'package:wallify/utils/extensions.dart';

class Payment extends StatefulWidget {
  const Payment({Key key,this.amount}) : super(key: key);
  final String amount;

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  UtilClass _utilClass = UtilClass();
  final formatter = NumberFormat("#,###");
  int _amount;

  @override
  void initState() {
    _amount = int.parse(widget.amount);
    super.initState();
  }

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
              SizedBox(height: 40,),
              _amountArea(amount: formatter.format(_amount)),
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment Method',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 19,
                    backgroundColor: Colors.grey[200],
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.clear,
                      ),
                      iconSize: 20,
                      color: Colors.black,
                    ),

                  ),
                ),
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: _utilClass.paymentMethod.map((e) => tile(
              thumbnail: e['thumbnail'],
              title: e['title']
            )
            ).toList(),
          ),
        ],
      ),
    );
  }

  Widget tile({String date, String thumbnail, String title, String price}){
    return ListTile(
      onTap: (){
        print('kk');
      },
      leading: Image.asset(
        thumbnail.png,
        height: 25,
        width: 25,
      ),
      title: Text(title,style: TextStyle(fontSize: 14),),
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }

}
