import 'package:flutter/material.dart';
import 'package:two_one_nov_project/services/auth.dart';
import 'package:two_one_nov_project/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //text field state
  String email = '';
  String password = '';
  String error = '';
  String currentIdentity = 'child';
  String currentBloodType = '';
  String currentUsername = '';
  String currentFullName = '';
  String currentAge = '';
  String currentIC = '';
  String currentTel = '';
  String currentETel = '';
  String currentDisease = '';

  final List<String> identity = ['child', 'pregnant', 'elderly','physically disabled', 'underlying medical condition','others'];
  final List<String> bloodType = ['A', 'AB', 'O','B'];
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        backgroundColor: Colors.deepOrange[300],
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => widget.toggleView(),),
        title: Text("Register",
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
                Center(child: Image.asset('asset/register.png',height:160.0)),
                SizedBox(height: 20.0),
                Center(
                  child: Text("Introduce yourself.",
                      style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Email'),
                  //decoration: textDecoration.copyWith(hintText: 'Email'),
                  validator: (val)=>val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val){
                    setState(() {
                      email = val;
                    });
                    print(val);
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Password'),
                  //decoration: textDecoration.copyWith(hintText: 'Password'),
                  validator: (val)=>val.length<6 ? 'Enter a password 6+ chars long' : null,
                  obscureText: true,
                  onChanged: (val){
                    setState(() {
                      password = val;
                    });
                    print(val);
                  },
                ),
                SizedBox(height: 40.0),
                Text("Personal Information",
                    style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 20.0,),
                TextFormField(
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
                            child: TextFormField(
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
                TextFormField(
                  decoration: InputDecoration(hintText: 'Identity Card (IC)'),
                  //decoration: textDecoration.copyWith(hintText: 'Password'),
                  validator: (val)=>(val.isEmpty) ? 'Enter the correct IC (XXXXXX-XX-XXXX)' : null,
                  onChanged: (val){
                    setState(() {
                      currentIC = val;
                    });
                    print(val);
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Disease'),
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
                TextFormField(
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
                TextFormField(
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
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Identity:",style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),),
                      DropdownButton<String>(
                        value: (currentIdentity.isEmpty) ? identity[0] : currentIdentity,
                        items: identity.map<DropdownMenuItem<String>>((String value){
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue){
                          setState(() {
                            currentIdentity = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: RaisedButton(
                      color: Colors.deepOrange,
                      onPressed: () async{
                        print(email);
                        print(password);
                        print(currentDisease);
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.registerWithEmailAndPassword(email,password,currentUsername,currentFullName,currentAge,currentIC,currentDisease,currentTel,currentETel,currentIdentity);
                        if(result == null){
                          setState(() {
                            error = "COULD NOT REGISTER!";
                            loading = false;
                          });
                        }
                      },
                      child: Text('Register', style:TextStyle(color: Colors.white),)
                  ),
                ),
                Text(error, style: TextStyle(color: Colors.red,fontSize: 14.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}