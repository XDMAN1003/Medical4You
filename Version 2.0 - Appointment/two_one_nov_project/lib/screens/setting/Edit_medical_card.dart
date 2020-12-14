import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_one_nov_project/models/medical.dart';
import 'package:two_one_nov_project/models/user.dart';
import 'package:two_one_nov_project/services/database.dart';
import 'package:two_one_nov_project/shared/loading.dart';

class Edit_Medical_Card extends StatefulWidget {
  @override
  _Edit_Medical_CardState createState() => _Edit_Medical_CardState();
}
final _formKey = GlobalKey<FormState>();
class _Edit_Medical_CardState extends State<Edit_Medical_Card> {
  String currentMedicalRecord;
  String currentAllergies;
  String currentMedicine;
  String currentBloodType;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    final List<String> bloodType = ['A', 'AB', 'O','B'];

    return StreamBuilder<MedicalData>(
        stream: DatabaseService(uid: user.uid).medicalData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            MedicalData medicalData = snapshot.data;

            return Scaffold(
              appBar: AppBar(
                title : Text('Edit Medical Card'),
                centerTitle : true,
                backgroundColor: Colors.deepOrange[300],
                elevation: 0.0,
                automaticallyImplyLeading: true,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
                            child: Text("Edit Medical Card.",
                                style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 20.0,),
                          Text('Personal Medical Record',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                          TextFormField(
                            initialValue: medicalData.medical_record ?? null,
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
                          Text('ALLERGIES',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                          TextFormField(
                            initialValue: medicalData.allergies ?? null,
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
                          Text('MEDICINE',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                          TextFormField(
                            initialValue: medicalData.medicine ?? null,
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
                          Text('BLOOD TYPE',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                          DropdownButton<String>(
                            value: (currentBloodType == null) ? medicalData.bloodType: currentBloodType,
                            items: bloodType.map<DropdownMenuItem<String>>((String value){
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue){
                              setState(() {
                                currentBloodType = newValue;
                                print(currentBloodType);
                              });
                            },
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 0.0,horizontal: 50.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                RaisedButton(
                                    color: Colors.green[500],
                                    onPressed: () async{
                                      await DatabaseService(uid: user.uid).updateMedicData(
                                          currentMedicalRecord ?? snapshot.data.medical_record,
                                          currentAllergies ?? snapshot.data.allergies,
                                          currentMedicine ?? snapshot.data.medicine,
                                          currentBloodType ?? snapshot.data.bloodType
                                      );
                                      //await DatabaseService(uid: user.uid).notFirstTime();
                                      Navigator.pop(context);
                                    },
                                    child: Text('Update', style:TextStyle(color: Colors.white),)
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
          } else {
            return Loading();
          }
        });

  }
}
