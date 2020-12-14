import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:two_one_nov_project/models/user.dart';
import 'package:two_one_nov_project/screens/appointment/approve_app.dart';
import 'package:two_one_nov_project/screens/appointment/no_app_list.dart';
import 'package:two_one_nov_project/screens/appointment/others_app.dart';
import 'package:two_one_nov_project/shared/loading.dart';


class BookingList extends StatefulWidget {
  @override
  _BookingListState createState() => _BookingListState();
}

double opacityValue = 0.0;
bool approve = true;
final List<String> doc_pic = ['asset/doctor.jpg','asset/doctor (1).jpg','asset/doctor (2).jpg','asset/doctor (3).jpg'];
final List<String> listOfDoc= ['Dr Lim Wei Han', 'Dr Leow Zheng Tao', 'Dr Nurfa Hadirah binti Tabri','Dr Nuratifah Binti Zailani'];
String currentImage;
Color textColor;
class _BookingListState extends State<BookingList> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder(
      stream: Firestore.instance.collection('appointment_'+user.uid).snapshots(),
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
                if(document["status"] == 'cancel'){
                  textColor = Colors.deepOrange[500];
                  opacityValue = 0.4;
                  approve = false;
                }
                else if(document["status"] == 'pending'){
                  textColor = Colors.amber;
                  opacityValue = 1.0;
                  approve = false;
                }
                else if(document["status"] == 'completed'){
                  textColor = Colors.blueAccent;
                  opacityValue = 1.0;
                  approve = true;
                }
                else{
                  textColor = Colors.green;
                  opacityValue = 1.0;
                  approve = true;
                }
                return (approve == true)?okApp(document: document,opacityValue: opacityValue,currentImage: currentImage,textColor: textColor,choice: "status",):noApp(document: document,opacityValue: opacityValue,currentImage: currentImage,textColor: textColor,choice: "status");
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
