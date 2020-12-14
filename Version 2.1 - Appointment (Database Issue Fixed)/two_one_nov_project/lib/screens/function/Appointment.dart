import 'dart:io';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:two_one_nov_project/models/user.dart';
import 'package:two_one_nov_project/services/database.dart';
import 'package:two_one_nov_project/shared/loading.dart';

class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}
final _formKey = GlobalKey<FormState>();
class _AppointmentState extends State<Appointment> {
  bool loading = false;
  String currentAddress;
  String currentDocNotes;
  DateTime currentDate;
  final List<String> timeframe = ['0800 (8.00am)', '1000 (10.00am)', '1200 (12.00pm) ','1400 (2.00pm)', '1600 (4.00pm) ','1800 (6.00pm) ','2000 (8.00pm) '];
  final List<String> listOfDoc= ['Dr Lim Wei Han', 'Dr Leow Zheng Tao', 'Dr Nurfa Hadirah binti Tabri','Dr Nuratifah Binti Zailani'];
  String currentAppTime = '0800 (8.00am)';
  String currentAppDoctor = 'Dr Lim Wei Han';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[300],
        centerTitle: true,
        title: Text("Add New Appointment",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          child: Form(
            key:_formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(child: Image.asset('asset/appointment.png',height:160.0),),
                  SizedBox(height: 20.0),
                  Center(
                    child: Text("Add New Appointment.",
                        style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 20.0,),
                  Text('APPOINTMENT DATE',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                  DateTimePickerFormField(
                    inputType: InputType.date,
                    format: DateFormat("dd-MM-yyyy"),
                    initialDate: DateTime.now().add(Duration(days: 2)),
                    validator: (val)=>(val.difference(DateTime.now())).inDays <1 ? 'Enter a appointment which 2 days after today': null  ,
                    editable: false,
                    decoration: InputDecoration(
                        labelText: 'Date',
                    ),
                    onChanged: (dt) {
                      setState(() => currentDate = dt);
                      print('Selected date: $currentDate');
                    },
                  ),
                  SizedBox(height: 20.0),
                  Text('APPOINTMENT TIME',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                  DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    isExpanded: true,
                    value: (currentAppTime == null) ? timeframe[0] : currentAppTime,

                    items: timeframe.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String newValue){
                      setState(() {
                        currentAppTime = newValue;
                        print(newValue);
                      });
                    },
                  ),
                  SizedBox(height:20.0),
                  Text('Available Doctor',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                    isExpanded: true,
                    value: (currentAppDoctor == null) ? listOfDoc[0] : currentAppDoctor,

                    items: listOfDoc.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String newValue){
                      setState(() {
                        currentAppDoctor = newValue;
                        print(newValue);
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  Text('ADDRESS',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Address'),
                    //decoration: textDecoration.copyWith(hintText: 'Password'),
                    validator: (val)=>(val.isEmpty) ? 'Enter your current address' : null,
                    onChanged: (val){
                      setState(() {
                        currentAddress = val;
                      });
                      print(val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  Text('NOTE FOR DOCTOR',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Note for Doctor (If Yes)'),
                    //decoration: textDecoration.copyWith(hintText: 'Password'),
                    //validator: (val)=>(val.isEmpty) ? 'Enter m.' : null,
                    onChanged: (val){
                      setState(() {
                        currentDocNotes = val;
                      });
                      print(val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 0.0,horizontal: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RaisedButton(
                            color: Colors.green[500],
                            onPressed: () async{
                              if(_formKey.currentState.validate()){
                                await DatabaseService(uid: user.uid).updateAppData(
                                    currentDate,currentAppTime,currentAppDoctor,currentAddress,currentDocNotes
                                );
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
}
