import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_one_nov_project/models/user.dart';
import 'package:two_one_nov_project/services/database.dart';
final _formKey = GlobalKey<FormState>();

class PaymentForm extends StatelessWidget {
  final List<String> payMe;
  final String appDate;
  final String method;
  final String desc1;
  final String desc2;
  String currentMethod;
  String seriesNum;
  PaymentForm({this.appDate,this.payMe,this.method,this.desc1,this.desc2});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    currentMethod = payMe[0];
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.0,),
          Text(desc1,style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
            isExpanded: true,
            value: (currentMethod == null) ? payMe[0] : currentMethod,
            items: payMe.map<DropdownMenuItem<String>>((String value){
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String newValue){
              currentMethod = newValue;
            },
          ),
          SizedBox(height: 10.0,),
          Text(desc2,style:TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
          TextFormField(
            //initialValue: userData.age,
            validator: (val)=>(val.isEmpty) ? 'Enter your $desc2' : null,
            onChanged: (val){
              seriesNum = val;
              print(val);
            },
          ),
          SizedBox(height: 10.0,),
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
                        await DatabaseService(uid: user.uid).updateBillReport(appDate, method, currentMethod, seriesNum);
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
          SizedBox(height: 20.0,)

        ],
      ),
    );
  }
}
