import 'package:flutter/material.dart';
import 'package:two_one_nov_project/services/auth.dart';
import 'package:two_one_nov_project/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[300],
        centerTitle: true,
        title: Text("Medical4You",
          style: TextStyle(color: Colors.white, fontSize: 25.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Image.asset('asset/sign_in.png',height:160.0),
                  SizedBox(height: 20.0),
                  Text("Welcome to Medical4You",
                      style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Email"),
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
                    decoration: InputDecoration(hintText: "Password"),
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
                  SizedBox(height: 20.0),
                  RaisedButton(
                      color: Colors.lightBlueAccent,
                      onPressed: () async{
                        print(email);
                        print(password);
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if(result == null){
                          setState(() {
                            error = "COULD NOT LOGIN!";
                            loading = false;
                          });
                        }
                        else{
                          print("Signed in");
                          print(result);
                        }
                      },
                      onLongPress: () async{
                        dynamic result = await _auth.signInAnon();
                        if(result == null){
                          setState(() {
                            error = "COULD NOT LOGIN!";
                            loading = false;
                          });
                        }
                        else{
                          print("Signed in");
                          print(result);
                        }
                      },
                      child: Text('Sign in', style:TextStyle(color: Colors.white),)
                  ),
                  FlatButton(onPressed: () => widget.toggleView(), child: Text("New User? Sign Up Here.",style: TextStyle(color:Colors.deepOrange[500],decoration: TextDecoration.underline,)), color: Colors.white,),
                  SizedBox(height: 12.0),
                  Text(error, style: TextStyle(color: Colors.red,fontSize: 14.0)),
                ],
              ),
            )
        ),
      ),
    );
  }
}