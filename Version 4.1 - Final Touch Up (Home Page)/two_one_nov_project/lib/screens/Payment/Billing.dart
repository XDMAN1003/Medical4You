import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:two_one_nov_project/models/user.dart';
import 'package:two_one_nov_project/screens/Payment/billing_medic.dart';
import 'package:two_one_nov_project/screens/Payment/payment_method.dart';
import 'package:two_one_nov_project/services/database.dart';
import 'package:two_one_nov_project/shared/loading.dart';

bool loading = false;
String total = "50.00";
final List<String> paymentMethod = ["Online Banking", "E-Wallet","Credit Card / Debit Card"];
String currentPaymentMethod = paymentMethod[0];

class Bill extends StatefulWidget {
  const Bill({
    Key key,
    this.document,
  }) : super(key: key);

  final DocumentSnapshot document;
  @override
  _BillState createState() => _BillState();
}

class _BillState extends State<Bill> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            UserData userData = snapshot.data;
            String total = (widget.document["price"] + widget.document["price1"] + widget.document["price2"] + 50).toStringAsFixed(2);

            return loading? Loading(): Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.deepOrange[300],
                centerTitle: true,
                title: Text("Billing Details",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        Center(
                          child: Text("Billing (${DateFormat('dd MMMM yyyy').format(widget.document["appDate"].toDate())})",
                              style: TextStyle(color: Colors.grey[700], fontSize: 25.0, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 20.0,),
                        Text("Appointment Details",style: TextStyle(color: Colors.grey[700], fontSize: 20.0, fontWeight: FontWeight.bold)),
                        SizedBox(height:10.0),
                        Text("Patient Name: ${userData.name.toUpperCase()}",style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
                        SizedBox(height:5.0),
                        Text("Diease: ${userData.disease.toUpperCase()}",style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
                        SizedBox(height:5.0),
                        Text("Date: ${DateFormat('dd MMMM yyyy').format(widget.document["appDate"].toDate())}",style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
                        SizedBox(height:5.0),
                        Text("Time: ${widget.document["appTime"]}",style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
                        SizedBox(height:5.0),
                        Text("Doctor: ${widget.document["appDoctor"].toUpperCase()}", style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
                        SizedBox(height:20.0),
                        Text("Treatment Details",style: TextStyle(color: Colors.grey[700], fontSize: 20.0, fontWeight: FontWeight.bold)),
                        SizedBox(height:10.0),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0,0,0,0.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(width: 180,child: Text("Services",style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w500))),
                                    //Spacer(),
                                    SizedBox(width: 80,child: Text("Quantity",style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w500))),
                                    Text("Price (RM)",style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                SizedBox(height:10.0),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(width: 200,child: Text("Appointment",style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300))),
                                    //Spacer(),
                                    SizedBox(width: 80,child: Text("1",style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300))),
                                    Text("50.00",style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
                                  ],
                                ),
                              ],
                            )),
                        SizedBox(height:20.0),
                        MedicineWifPrice(medicine: widget.document["medicine"],quantity: widget.document["quantity"],price: widget.document["price"].toStringAsFixed(2),),
                        MedicineWifPrice(medicine: widget.document["medicine1"],quantity: widget.document["quantity1"],price: widget.document["price1"].toStringAsFixed(2),),
                        MedicineWifPrice(medicine: widget.document["medicine2"],quantity: widget.document["quantity2"],price: widget.document["price2"].toStringAsFixed(2),),
                        Divider(color: Colors.grey[700],thickness: 1,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width: 275,child: Text("Total",style: TextStyle(color: Colors.grey[700], fontSize: 20.0,fontWeight: FontWeight.w300))),
                            //Spacer(),
                            Text(total,style: TextStyle(color: Colors.grey[700], fontSize: 20.0,fontWeight: FontWeight.w700)),
                          ],
                        ),
                        Divider(color: Colors.grey[700],thickness: 1,),
                        SizedBox(height:20.0),
                        Text("Payment Details",style: TextStyle(color: Colors.grey[700], fontSize: 20.0, fontWeight: FontWeight.bold)),
                        SizedBox(height:10.0),
                        Text('Payment Method',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey))),
                          isExpanded: true,
                          value: (currentPaymentMethod == null) ? paymentMethod[0] : currentPaymentMethod,
                          items: paymentMethod.map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue){
                            setState(() {
                              currentPaymentMethod = newValue;
                            });

                          },
                        ),
                        PaymentMethod(method: currentPaymentMethod,date: widget.document["appDate"].toDate(),),
                      ]
                  ),
                ),
              ),
            );
          }
          else{
            return Loading();
          }
        }
    );
  }
}

