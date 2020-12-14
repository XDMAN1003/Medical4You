import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:two_one_nov_project/models/user.dart';
import 'package:two_one_nov_project/services/database.dart';
import 'package:two_one_nov_project/shared/loading.dart';
final _formKey = GlobalKey<FormState>();
bool loading = false;
final List<String> doctor_comment = ["Good! Take Care!","Terrible!","Keep It on!","Sorry..."];
class AppDetails extends StatelessWidget {
  final DocumentSnapshot document;
  String currentComment;
  String currentMedicine;
  String currentMedicine1;
  String currentMedicine2;
  String currentQuantity;
  String currentQuantity1;
  String currentQuantity2;
  String currentShortComment = doctor_comment[0];
  AppDetails({this.document});
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData userData = snapshot.data;
          return loading? Loading(): Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.deepOrange[300],
              centerTitle: true,
              title: Text("For Doctor' Use",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: Form(
                  key:_formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(child: Image.asset('asset/doctor.png',height:160.0),),
                        SizedBox(height: 20.0),
                        Center(
                          child: Text("Doctor's Report",
                              style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 20.0,),
                        Text("Appointment Details",style: TextStyle(color: Colors.grey[700], fontSize: 20.0, fontWeight: FontWeight.bold)),
                        SizedBox(height:10.0),
                        Text("Patient Name: ${userData.name.toUpperCase()}",style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
                        SizedBox(height:5.0),
                        Text("Diease: ${userData.disease.toUpperCase()}",style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
                        SizedBox(height:5.0),
                        Text("Date: ${DateFormat('dd MMMM yyyy').format(document["appDate"].toDate())}",style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
                        SizedBox(height:5.0),
                        Text("Time: ${document["appTime"]}",style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
                        SizedBox(height:5.0),
                        Text("Doctor: ${document["appDoctor"].toUpperCase()}", style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
                        SizedBox(height:20.0),
                        Text("Treatment Details",style: TextStyle(color: Colors.grey[700], fontSize: 20.0, fontWeight: FontWeight.bold)),
                        SizedBox(height:10.0),
                        SizedBox(height:20.0),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0,0,0,0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: Text('Medicine',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                                  ),
                                  flex: 2,
                                ),
                                SizedBox(width: 170.0,),
                                Flexible(
                                  child: Text('Quantity',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                                  flex: 1,
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0,0,0,0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: TextFormField(
                                      //initialValue: userData.name,
                                      decoration: const InputDecoration(
                                          hintText: "Medicine Name"),
                                      //validator: (val)=>(val.isEmpty) ? 'Enter the correct name' : null,
                                      onChanged: (val){
                                        currentMedicine = val;
                                        print(val);
                                      },
                                    ),
                                  ),
                                  flex: 2,
                                ),
                                Flexible(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        hintText: "Quantity"),
                                    //initialValue: userData.age,
                                    //validator: (val)=>(val.isEmpty) ? 'Enter the correct age' : null,
                                    onChanged: (val){
                                      currentQuantity = val;
                                      print(val);
                                    },
                                  ),

                                  flex: 1,
                                ),
                              ],
                            )),
                        SizedBox(height:10.0),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0,0,0,0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: TextFormField(
                                      //initialValue: userData.name,
                                      decoration: const InputDecoration(
                                          hintText: "Medicine Name"),
                                      //validator: (val)=>(val.isEmpty) ? 'Enter the correct name' : null,
                                      onChanged: (val){
                                        currentMedicine1 = val;
                                        print(val);
                                      },
                                    ),
                                  ),
                                  flex: 2,
                                ),
                                Flexible(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        hintText: "Quantity"),
                                    //initialValue: userData.age,
                                    //validator: (val)=>(val.isEmpty) ? 'Enter the correct age' : null,
                                    onChanged: (val){
                                      currentQuantity1 = val;
                                      print(val);
                                    },
                                  ),

                                  flex: 1,
                                ),
                              ],
                            )),
                        SizedBox(height:10.0),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0,0,0,0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: TextFormField(
                                      //initialValue: userData.name,
                                      decoration: const InputDecoration(
                                          hintText: "Medicine Name"),
                                      //validator: (val)=>(val.isEmpty) ? 'Enter the correct name' : null,
                                      onChanged: (val){
                                        currentMedicine2 = val;
                                        print(val);
                                      },
                                    ),
                                  ),
                                  flex: 2,
                                ),
                                Flexible(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        hintText: "Quantity"),
                                    //initialValue: userData.age,
                                    //validator: (val)=>(val.isEmpty) ? 'Enter the correct age' : null,
                                    onChanged: (val){
                                      currentQuantity2 = val;
                                      print(val);
                                    },
                                  ),

                                  flex: 1,
                                ),
                              ],
                            )),
                        SizedBox(height:20.0),
                        Text('Doctor Advice',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Advice for patient'),
                          //decoration: textDecoration.copyWith(hintText: 'Password'),
                          //validator: (val)=>(val.isEmpty) ? 'Enter your advice for the patient' : null,
                          onChanged: (val){
                            currentComment = val;
                            print(val);
                          },
                        ),
                        SizedBox(height:20.0),
                        Text('Comment',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey))),
                          isExpanded: true,
                          value: (currentShortComment == null) ? doctor_comment[0] : currentShortComment,

                          items: doctor_comment.map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue){
                            currentShortComment = newValue;
                            print(newValue);
                          },
                        ),
                        SizedBox(height: 20.0,),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 0.0,horizontal: 50.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RaisedButton(
                                  color: Colors.green[500],
                                  onPressed: () async{
                                    if(_formKey.currentState.validate()){
                                     await DatabaseService(uid:user.uid).updateHealthReport(document["appDate"].toDate(), currentMedicine, currentMedicine1,
                                         currentMedicine2, currentQuantity, currentQuantity1, currentQuantity2, currentShortComment, currentComment);
                                      Navigator.pop(context);
                                    }
                                    //
                                  },
                                  child: Text('Add', style:TextStyle(color: Colors.white),)
                              ),
                              RaisedButton(
                                  color: Colors.deepOrange,
                                  onPressed: () async{
                                    //await DatabaseService(uid: user.uid).updateMedicData(currentMedicalRecord, currentAllergies, currentMedicine, currentBloodType);
                                    //await DatabaseService(uid: user.uid).notFirstTime();
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel', style:TextStyle(color: Colors.white),)
                              ),
                            ],
                          ),
                        ),


                      ]
                  ),
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
