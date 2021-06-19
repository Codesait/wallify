import 'package:flutter/material.dart';

fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

fullHeigth(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
class UtilClass {
  Color primaryColor = Colors.green;
  Color purple = Colors.deepPurpleAccent;

  TextStyle boldLogoText = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 45);

 final List<Map> featureData =[
    {
      "title": "Top Up",
      "icon": "assets/images/top_up",
      "backgroundColor": 0xFFe942f5,
      "route": "/topUp"
    },
    {
      "title": "Transfer",
      "icon": "assets/images/send",
      "backgroundColor": 0xFFe0c02f,
      "route": "/topUp"
    },
    {
      "title": "Internet",
      "icon": "assets/images/internet",
      "backgroundColor": 0xFF388E3C,
      "route": "/topUp"
    },
    {
      "title": "Wallet",
      "icon": "assets/images/wallet",
      "backgroundColor": 0xFFf03743,
      "route": "/topUp"
    },
    {
      "title": "Bill",
      "icon": "assets/images/invoice",
      "backgroundColor": 0xFFe0c02f,
      "route": "/topUp"
    },
    {
      "title": "Game",
      "icon": "assets/images/video_game",
      "backgroundColor": 0xFF388E3C,
      "route": "/topUp"
    },
    {
      "title": "Mobile",
      "icon": "assets/images/smartphone",
      "backgroundColor": 0xFFf03743,
      "route": "/topUp"
    },
    {
      "title": "More",
      "icon": "assets/images/more",
      "backgroundColor": 0xFFe942f5,
      "route": "/topUp"
    },
  ];

 List<Map> promos = [
   {
     "thumbnail":"share",
     "title": "Share and Earn",
     "description": r"Invite your friends and family to earn $2",
     "route": "/share"
   },
   {
     "thumbnail":"share",
     "title": "Share and Earn",
     "description":r"Invite your friends and earn $100",
     "route": "/share"
   }
 ];

 List<Map> dummyTransactions = [
   {
     "thumbnail":"netflix",
     "title": "Share and Earn",
     "price": r"$ 58.00",
     "date": "10 Feb, 2021"
   },
   {
     "thumbnail":"netflix",
     "title": "Share and Earn",
     "price": r"$ 58.00",
     "date": "10 Feb, 2021"
   },
   {
     "thumbnail":"netflix",
     "title": "Netflix",
     "price": r"$ 58.00",
     "date": "10 Feb, 2021"
   },
   {
     "thumbnail":"netflix",
     "title": "Share and Earn",
     "price": r"$ 58.00",
     "date": "10 Feb, 2021"
   },
   {
     "thumbnail":"netflix",
     "title": "Share and Earn",
     "price": r"$ 58.00",
     "date": "10 Feb, 2021"
   },

 ];

 List<Map> paymentMethod = [
   {
     "thumbnail":"transfer",
     "title": "Bank Transfer",
   },
   {
     "thumbnail":"gpay",
     "title": "Google Pay",
   },
   {
     "thumbnail":"stripe",
     "title": "Stripe",
   },
   {
     "thumbnail":"bitcoin",
     "title": "Bitcoin",
   }
 ];


  List<Map> moreFeatures = [
    {
      "title": "Buy",
      "icon": Icons.store_rounded,
      "backgroundColor": 0xFF388E3C,
      "route": "/topUp"
    },
    {
      "title": "Sell",
      "icon": Icons.sentiment_satisfied_sharp,
      "backgroundColor": 0xFFf03743,
      "route": "/topUp"
    },
    {
      "title": "Deposit",
      "icon": Icons.account_balance_wallet_outlined,
      "backgroundColor": 0xFF771BE5,
      "route": "/topUp"
    },
    {
      "title": "Withdraw",
      "icon": Icons.money,
      "backgroundColor": 0xFFe0c02f,
      "route": "/topUp"
    },
    {
      "title": "Send",
      "icon": Icons.call_made,
      "backgroundColor": 0xFF2196F3,
      "route": "/topUp"
    },
    {
      "title": "Request",
      "icon": Icons.call_received,
      "backgroundColor": 0xFFE7259B,
      "route": "/topUp"
    },

  ];
}

