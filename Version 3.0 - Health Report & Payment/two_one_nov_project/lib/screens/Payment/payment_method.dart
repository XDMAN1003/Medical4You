import 'package:flutter/material.dart';
import 'package:two_one_nov_project/screens/Payment/payment_form.dart';
import 'package:two_one_nov_project/shared/loading.dart';

class PaymentMethod extends StatelessWidget {
  final String method;
  final String date;
  List<String> paymentMethod = ["Online Banking", "E-Wallet","Credit Card / Debit Card"];
  List<String> bank = ["Maybank","CIMB Clicks","Public Bank","RHB Now","Ambank","MyBSN","Bank Rakyat","UOB",
  "Affin Bank","Bank Islam","HSBS Online","Standard Chartered Bank","Kuwait Finance House","OCBC Online",
  "Alliance Bank (Personal)", "Hong Leong Connect"];
  List<String> ewallet = ["ShopeePay","MCash","Boost Wallet","Grab Pay","Touch 'n Go eWallet"];
  List<String> creditCard = ["Master Card", "Visa"];
  PaymentMethod({this.date,this.method});
  @override
  Widget build(BuildContext context) {
    if(method == paymentMethod[0]){
      return PaymentForm(appDate: date,method:method,payMe: bank,desc1: "Selected Bank",desc2: "Account Number",);
    }
    else if(method == paymentMethod[1]){
      return PaymentForm(appDate: date,method:method,payMe: ewallet,desc1: "E-wallet",desc2: "Phone Number",);
    }
    else if(method == paymentMethod[2]){
      return PaymentForm(appDate: date,method:method,payMe: creditCard,desc1: "Credit Card / DebitCard",desc2: "Card Number",);
    }
    else{
      return Loading();
    }
  }
}
