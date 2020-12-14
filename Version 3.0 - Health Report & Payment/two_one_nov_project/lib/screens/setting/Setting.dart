import 'package:flutter/material.dart';
import 'package:two_one_nov_project/screens/function/Appointment.dart';
import 'package:two_one_nov_project/screens/home/Emergency.dart';
import 'package:two_one_nov_project/screens/home/Separator.dart';
import 'package:two_one_nov_project/screens/setting/Edit_Profile.dart';
import 'package:two_one_nov_project/screens/setting/Edit_medical_card.dart';
import 'package:two_one_nov_project/services/auth.dart';

final AuthService _auth = AuthService();

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          width: double.infinity,
          height: 70.0,
          child: DecoratedBox(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black45))),
            child: FlatButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfile()),
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10.0, 20.0, 5.0),
                    child: Icon(Icons.people_alt_outlined,color: Colors.grey[700],size: 30.0,),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding:  const EdgeInsets.fromLTRB(0, 15.0, 0.0, 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Edit Profile",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                          Text("Name, IC, Email, Phone Number", style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                        ],
                      ),
                    ),
                  ),
                  FlatButton(minWidth:40.0, height: 50.0, onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  }, child: Icon(Icons.chevron_right,size: 35.0,color: Colors.grey[700],)),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 70.0,
          child: DecoratedBox(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black45))),
            child: FlatButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Edit_Medical_Card()),
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10.0, 20.0, 5.0),
                    child: Icon(Icons.credit_card_rounded,color: Colors.grey[700],size: 30.0,),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding:  const EdgeInsets.fromLTRB(0, 15.0, 0.0, 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Edit Medical Card",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                          Text("Medical Experience, Disease", style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                        ],
                      ),
                    ),
                  ),
                  FlatButton(minWidth:40.0, height: 50.0, onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Edit_Medical_Card()),
                    );
                  }, child: Icon(Icons.chevron_right,size: 35.0,color: Colors.grey[700],)),
                ],
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 1.0,
          child: SizedBox(
            width: double.infinity,
            height: 70.0,
            child: DecoratedBox(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black45))),
              child: FlatButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (Appointment())));
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10.0, 20.0, 5.0),
                      child: Icon(Icons.calendar_today_outlined,color: Colors.grey[700],size: 30.0,),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding:  const EdgeInsets.fromLTRB(0, 15.0, 0.0, 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Add New Appointment",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                            Text("Booking for your new appointment", style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                          ],
                        ),
                      ),
                    ),
                    FlatButton(minWidth:40.0, height: 50.0, onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => (Appointment())));
                    },
                        child: Icon(Icons.chevron_right,size: 35.0,color: Colors.grey[700],)),
                  ],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: SizedBox(
            width: double.infinity,
            height: 70.0,
            child: DecoratedBox(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black45))),
              child: FlatButton(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10.0, 20.0, 5.0),
                      child: Icon(Icons.hourglass_full,color: Colors.grey[700],size: 30.0,),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding:  const EdgeInsets.fromLTRB(0, 25.0, 0.0, 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Coming Soon",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                            //Text("Update Soon", style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                          ],
                        ),
                      ),
                    ),
                    //FlatButton(minWidth:40.0, height: 50.0, onPressed: (){}, child: Icon(Icons.chevron_right,size: 35.0,color: Colors.grey[700],)),
                  ],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: SizedBox(
            width: double.infinity,
            height: 70.0,
            child: DecoratedBox(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black45))),
              child: FlatButton(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10.0, 20.0, 5.0),
                      child: Icon(Icons.hourglass_full,color: Colors.grey[700],size: 30.0,),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding:  const EdgeInsets.fromLTRB(0, 25.0, 0.0, 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Coming Soon",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                            //Text("Update Soon", style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                          ],
                        ),
                      ),
                    ),
                    //FlatButton(minWidth:40.0, height: 50.0, onPressed: (){}, child: Icon(Icons.chevron_right,size: 35.0,color: Colors.grey[700],)),
                  ],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: SizedBox(
            width: double.infinity,
            height: 70.0,
            child: DecoratedBox(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black45))),
              child: FlatButton(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10.0, 20.0, 5.0),
                      child: Icon(Icons.hourglass_full,color: Colors.grey[700],size: 30.0,),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding:  const EdgeInsets.fromLTRB(0, 25.0, 0.0, 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Coming Soon",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                            //Text("Update Soon", style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                          ],
                        ),
                      ),
                    ),
                    //FlatButton(minWidth:40.0, height: 50.0, onPressed: (){}, child: Icon(Icons.chevron_right,size: 35.0,color: Colors.grey[700],)),
                  ],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: SizedBox(
            width: double.infinity,
            height: 70.0,
            child: DecoratedBox(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black45))),
              child: FlatButton(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10.0, 20.0, 5.0),
                      child: Icon(Icons.hourglass_full,color: Colors.grey[700],size: 30.0,),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding:  const EdgeInsets.fromLTRB(0, 25.0, 0.0, 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Coming Soon",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                            //Text("Update Soon", style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                          ],
                        ),
                      ),
                    ),
                    //FlatButton(minWidth:40.0, height: 50.0, onPressed: (){}, child: Icon(Icons.chevron_right,size: 35.0,color: Colors.grey[700],)),
                  ],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: SizedBox(
            width: double.infinity,
            height: 70.0,
            child: DecoratedBox(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black45))),
              child: FlatButton(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10.0, 20.0, 5.0),
                      child: Icon(Icons.hourglass_full,color: Colors.grey[700],size: 30.0,),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding:  const EdgeInsets.fromLTRB(0, 25.0, 0.0, 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Coming Soon",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                            //Text("Update Soon", style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                          ],
                        ),
                      ),
                    ),
                    //FlatButton(minWidth:40.0, height: 50.0, onPressed: (){}, child: Icon(Icons.chevron_right,size: 35.0,color: Colors.grey[700],)),
                  ],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: SizedBox(
            width: double.infinity,
            height: 70.0,
            child: DecoratedBox(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black45))),
              child: FlatButton(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10.0, 20.0, 5.0),
                      child: Icon(Icons.hourglass_full,color: Colors.grey[700],size: 30.0,),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding:  const EdgeInsets.fromLTRB(0, 25.0, 0.0, 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Coming Soon",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                            //Text("Update Soon", style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                          ],
                        ),
                      ),
                    ),
                    //FlatButton(minWidth:40.0, height: 50.0, onPressed: (){}, child: Icon(Icons.chevron_right,size: 35.0,color: Colors.grey[700],)),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Center(
            child: Text(
              "App is created by Medical4You Team",
              style: TextStyle(color: Colors.grey[400]),
            ))



      ],
    );
  }
}
