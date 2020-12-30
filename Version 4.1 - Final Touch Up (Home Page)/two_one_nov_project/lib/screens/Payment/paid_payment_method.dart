import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:two_one_nov_project/screens/Payment/payment_form.dart';
import 'package:two_one_nov_project/shared/loading.dart';

class PaidPaymentMethod extends StatelessWidget {
  final DocumentSnapshot document;

  PaidPaymentMethod({this.document});

  final List<String> paymentMethod = [
    "Online Banking",
    "E-Wallet",
    "Credit Card / Debit Card"
  ];

  @override
  Widget build(BuildContext context) {
    if (document["payment_method"] == paymentMethod[0]) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Payment Method", style: TextStyle(fontSize: 12.0, color: Colors.grey[500],fontWeight: FontWeight.bold),),
          SizedBox(height: 10.0,),
          Text("${document["payment_method"]}", style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
          SizedBox(height: 20.0,),
          Text("Selected Bank",style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
          SizedBox(height: 10.0,),
          Text("${document["payment_select"]}", style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
          SizedBox(height: 20.0,),
          Text("Account Number",style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
          SizedBox(height: 10.0,),
          Text("${document["series_num"]}", style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
          SizedBox(height: 20.0,),
        ]);
    }
    else if (document["payment_method"] == paymentMethod[1]) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Payment Method", style: TextStyle(fontSize: 12.0, color: Colors.grey[500],fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),
            Text("${document["payment_method"]}", style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
            SizedBox(height: 20.0,),
            Text("E-wallet",style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),
            Text("${document["payment_select"]}", style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
            SizedBox(height: 20.0,),
            Text("Phone Number",style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),
            Text("${document["series_num"]}", style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
            SizedBox(height: 20.0,),
          ]);
    }
    else if (document["payment_method"] == paymentMethod[2]) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Payment Method", style: TextStyle(fontSize: 12.0, color: Colors.grey[500],fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),
            Text("${document["payment_method"]}", style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
            SizedBox(height: 20.0,),
            Text("Credit Card / DebitCard",style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),
            Text("${document["payment_select"]}", style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
            SizedBox(height: 20.0,),
            Text("Card Number",style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
            SizedBox(height: 10.0,),
            Text("${document["series_num"]}", style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
            SizedBox(height: 20.0,),
          ]);
    }
    else{
    return Loading();
    }
  }
}
