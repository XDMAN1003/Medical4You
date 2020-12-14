import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_one_nov_project/models/user.dart';
import 'package:two_one_nov_project/screens/home/Separator.dart';
import 'package:two_one_nov_project/screens/wrapper.dart';
import 'package:two_one_nov_project/services/database.dart';
import 'package:two_one_nov_project/shared/loading.dart';


class AddMedical extends StatefulWidget {
  @override
  _AddMedicalState createState() => _AddMedicalState();
}

class _AddMedicalState extends State<AddMedical> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String currentMedicalRecord = '';
  String currentAllergies = '';
  String currentMedicine = '';

  final List<String> bloodType = ['A', 'AB', 'O','B'];
  String currentBloodType = 'A';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return loading? Loading(): Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[300],
        centerTitle: true,
        title: Text("Add Medical Card",
          style: TextStyle(color: Colors.white, fontSize: 25.0),
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
                  Center(child: Image.asset('asset/medical_card.png',height:160.0),),
                  SizedBox(height: 20.0),
                  Center(
                    child: Text("Add Medical Card.",
                        style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Personal Medical Record (If Yes)'),
                    //decoration: textDecoration.copyWith(hintText: 'Password'),
                    //validator: (val)=>(val.isEmpty) ? 'Enter your medical record' : null,
                    onChanged: (val){
                      setState(() {
                        currentMedicalRecord = val;
                      });
                      print(val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Allergies (If Yes)'),
                    //decoration: textDecoration.copyWith(hintText: 'Password'),
                    //validator: (val)=>(val.isEmpty) ? 'Enter your allergies' : null,
                    onChanged: (val){
                      setState(() {
                        currentAllergies = val;
                      });
                      print(val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Medicine Taking (If Yes)'),
                    //decoration: textDecoration.copyWith(hintText: 'Password'),
                    //validator: (val)=>(val.isEmpty) ? 'Enter medicine taking.' : null,
                    onChanged: (val){
                      setState(() {
                        currentMedicine = val;
                      });
                      print(val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  Text("Blood Type"),
                  DropdownButton<String>(
                    value: (currentBloodType.isEmpty) ? bloodType[0] : currentBloodType,
                    items: bloodType.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue){
                      setState(() {
                        currentBloodType = newValue;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: RaisedButton(
                        color: Colors.deepOrange,
                        onPressed: () async{
                          await DatabaseService(uid: user.uid).updateMedicData(currentMedicalRecord, currentAllergies, currentMedicine, currentBloodType);
                          await DatabaseService(uid: user.uid).notFirstTime();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Wrapper()),
                          );
                        },
                        child: Text('Complete', style:TextStyle(color: Colors.white),)
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
