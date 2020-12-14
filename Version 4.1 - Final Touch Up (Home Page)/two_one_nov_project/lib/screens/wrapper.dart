import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_one_nov_project/models/booking.dart';
import 'package:two_one_nov_project/models/user.dart';
import 'package:two_one_nov_project/screens/home/Separator.dart';
import 'package:two_one_nov_project/services/database.dart';
import 'authenticate/authenticate.dart';
import 'home/Add_Medical.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return StreamBuilder < UserData > (
          stream: DatabaseService(uid: user.uid).userData,
          builder: (context, snapshot) {
            UserData userData = snapshot.data;
            if (snapshot.hasData && userData.first == true) {
              return AddMedical();
          }
          else{
              return Homie(index: 0,);
              }
          });
  }
  }

  }