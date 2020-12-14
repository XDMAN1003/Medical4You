import 'package:flutter/material.dart';
import 'package:two_one_nov_project/screens/function/Appointment.dart';
class NoDataApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 160.0, horizontal: 80.0),
        child: Column(
          children: [
            Image.asset('asset/nodata.png',height:200.0),
            SizedBox(height:20.0),
            Text("No Record(s) is found",style: TextStyle(color: Colors.grey[700], fontSize: 20.0, fontWeight: FontWeight.bold)),
            SizedBox(height:20.0),
            RaisedButton(
                color: Colors.deepOrange,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (Appointment())));
                },
                child: Text('Add New Appointment', style:TextStyle(color: Colors.white,fontSize: 15.0),)
            ),
          ],
        ),
      ),
    );
  }
}
