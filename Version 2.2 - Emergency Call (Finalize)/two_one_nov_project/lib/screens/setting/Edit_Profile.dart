import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_one_nov_project/models/user.dart';
import 'package:two_one_nov_project/services/database.dart';
import 'package:two_one_nov_project/shared/loading.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}
final _formKey = GlobalKey<FormState>();
class _EditProfileState extends State<EditProfile> {
  @override
  String error = '';
  String currentIdentity;
  String currentBloodType;
  String currentUsername;
  String currentFullName;
  String currentAge;
  String currentIC;
  String currentTel;
  String currentETel;
  String currentDisease;
  final List<String> identity = ['child', 'pregnant', 'elderly','physically disabled', 'underlying medical condition','others'];
  bool loading = false;

  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);


    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return  Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title : Text('Edit Profile'),
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
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
                  child: Form(
                    key:_formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                            child: CircleAvatar(
                              radius: 60.0,
                              backgroundImage: NetworkImage("https://i.pinimg.com/564x/bf/f4/c1/bff4c1e363359e8a1c48db2b75adfdf4.jpg"),
                            ),
                          ),

                        ),
                        SizedBox(height: 20.0),
                        Center(
                          child: Text("Personal Information",
                              style: TextStyle(color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(height: 20.0,),
                        Text('USERNAME',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                        TextFormField(
                          initialValue: userData.username,
                          decoration: InputDecoration(hintText: 'Username (Between 3 & 12 characters)'),
                          //decoration: textDecoration.copyWith(hintText: 'Password'),
                          validator: (val)=>(val.length<3 && val.length >13) ? 'Enter the username (Between 3 and 12 character)' : null,
                          onChanged: (val){
                            setState(() {
                              currentUsername = val;
                            });
                            print(val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0,0,0,0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: Text('FULL NAME',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                                  ),
                                  flex: 3,
                                ),
                                SizedBox(width: 160.0,),
                                Flexible(
                                  child: Text('AGE',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
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
                                      initialValue: userData.name,
                                      decoration: const InputDecoration(
                                          hintText: "Full Name"),
                                      validator: (val)=>(val.isEmpty) ? 'Enter the correct name' : null,
                                      onChanged: (val){
                                        setState(() {
                                          currentFullName = val;
                                        });
                                        print(val);
                                      },
                                    ),
                                  ),
                                  flex: 3,
                                ),
                                Flexible(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        hintText: "Age"),
                                    initialValue: userData.age,
                                    validator: (val)=>(val.isEmpty) ? 'Enter the correct age' : null,
                                    onChanged: (val){
                                      setState(() {
                                        currentAge = val;
                                      });
                                      print(val);
                                    },
                                  ),

                                  flex: 1,
                                ),
                              ],
                            )),
                        SizedBox(height: 20.0,),
                        Text("IDENTITY CARD (IC) ",style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Identity Card (IC)'),
                          //decoration: textDecoration.copyWith(hintText: 'Password'),
                          initialValue: userData.ic,
                          validator: (val)=>(val.isEmpty) ? 'Enter the correct IC (XXXXXX-XX-XXXX)' : null,
                          onChanged: (val){
                            setState(() {
                              currentIC = val;
                            });
                            print(val);
                          },
                        ),
                        SizedBox(height: 20.0,),
                        Text('DISEASE(S)',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Disease'),
                          initialValue: userData.disease,
                          //decoration: textDecoration.copyWith(hintText: 'Password'),
                          validator: (val)=>(val.isEmpty) ? 'Enter the disease.' : null,
                          onChanged: (val){
                            setState(() {
                              currentDisease = val;
                            });
                            print(val);
                          },
                        ),
                        SizedBox(height: 20.0,),
                        Text('CONTACT NUMBER',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                        TextFormField(
                          initialValue: userData.tel,
                          decoration: InputDecoration(hintText: 'Telephone Number'),
                          //decoration: textDecoration.copyWith(hintText: 'Password'),
                          validator: (val)=>(val.isEmpty) ? 'Enter the telephone number.' : null,
                          onChanged: (val){
                            setState(() {
                              currentTel = val;
                            });
                            print(val);
                          },
                        ),
                        SizedBox(height: 20.0,),
                        Text('EMERGENCY CONTACT NUMBER',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                        TextFormField(
                          initialValue: userData.etel,
                          decoration: InputDecoration(hintText: 'Emergency Number'),
                          //decoration: textDecoration.copyWith(hintText: 'Password'),
                          validator: (val)=>(val.isEmpty) ? 'Enter the Emergency Number' : null,
                          onChanged: (val){
                            setState(() {
                              currentETel = val;
                            });
                            print(val);
                          },
                        ),
                        SizedBox(height: 20.0,),
                        Text('IDENTITY',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                        DropdownButton<String>(
                          isExpanded: true,
                          value: (currentIdentity == null) ? userData.identity: currentIdentity,
                          items: <String>['child', 'pregnant', 'elderly','physically disabled', 'underlying medical condition'].map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue){
                            setState(() {
                              currentIdentity = newValue;
                              print(newValue);
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
                                    print(currentUsername);
                                    print(currentFullName);
                                    await DatabaseService(uid: user.uid).updateUserData(
                                        currentUsername ?? snapshot.data.username,
                                        currentFullName ?? snapshot.data.name,
                                        currentAge ?? snapshot.data.age,
                                        currentIC ?? snapshot.data.ic,
                                        currentDisease ?? snapshot.data.disease,
                                        currentTel ?? snapshot.data.tel,
                                        currentETel ?? snapshot.data.etel,
                                        currentIdentity ?? snapshot.data.identity
                                    );
                                    await DatabaseService(uid: user.uid).notFirstTime();
                                    Navigator.pop(context);
                                  },
                                  child: Text('Update', style:TextStyle(color: Colors.white),)
                              ),
                              RaisedButton(
                                  color: Colors.deepOrange,
                                  onPressed: () async{
                                    //await DatabaseService(uid: user.uid).updateUserData(currentUsername,currentFullName,currentAge,currentIC,currentDisease,currentTel,currentETel,currentIdentity);
                                    //await DatabaseService(uid: user.uid).notFirstTime();
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel', style:TextStyle(color: Colors.white),)
                              ),
                            ],
                          ),
                        ),
                        Text(error, style: TextStyle(color: Colors.red,fontSize: 14.0)),
                      ],
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
