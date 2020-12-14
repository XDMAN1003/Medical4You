import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_one_nov_project/models/user.dart';
import 'package:two_one_nov_project/screens/appointment/approve_app.dart';
import 'package:two_one_nov_project/screens/appointment/no_app_list.dart';
import 'package:two_one_nov_project/screens/appointment/others_app.dart';

class PaymentList extends StatefulWidget {
  @override
  _PaymentListState createState() => _PaymentListState();
}

double opacityValue = 0.0;
bool paid = true;
final List<String> doc_pic = ['asset/doctor.jpg','asset/doctor (1).jpg','asset/doctor (2).jpg','asset/doctor (3).jpg'];
final List<String> listOfDoc= ['Dr Lim Wei Han', 'Dr Leow Zheng Tao', 'Dr Nurfa Hadirah binti Tabri','Dr Nuratifah Binti Zailani'];
String currentImage;
Color textColor;

class _PaymentListState extends State<PaymentList> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder(
        stream: Firestore.instance.collection('appointment_'+user.uid).where('status', isEqualTo: "completed").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasData && snapshot.data.documents.length >0){
            //print(snapshot.data.documents.length == 0);
            return SafeArea(
              child: ListView(
                children: snapshot.data.documents.map((document) {
                  for(int k=0;k<4;k++){
                    if(listOfDoc[k] == document["appDoctor"]){
                      currentImage = doc_pic[k];
                    }
                  }
                  if(document["paid"] == 'to pay'){
                    textColor = Colors.deepOrange[500];
                    opacityValue = 1.0;
                    paid = true;
                  }
                  else if(document["paid"] == 'processing'){
                    textColor = Colors.amber;
                    opacityValue = 1.0;
                    paid = false;
                  }
                  else{
                    textColor = Colors.green;
                    opacityValue = 1.0;
                    paid = true;
                  }
                  return (paid == true)?okApp(document: document,opacityValue: opacityValue,currentImage: currentImage,textColor: textColor,choice: "paid",):noApp(document: document,opacityValue: opacityValue,currentImage: currentImage,textColor: textColor,choice: "paid");
                }).toList(),
              ),
            );
          }
          else{
            return NoDataApp();
          }
        }
    );
  }
}
