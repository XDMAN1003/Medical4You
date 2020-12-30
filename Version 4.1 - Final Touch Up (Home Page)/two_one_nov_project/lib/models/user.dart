import 'package:cloud_firestore/cloud_firestore.dart';

class User {

  final String uid;
  
  User({ this.uid });

}

class UserData {

  final String uid;
  final String name;
  final String username;
  final String age;
  final String disease;
  final String ic;
  final String identity;
  final String tel;
  final String etel;
  final String payment_date;
  final bool first;
  final Timestamp appointmentDate;
  final String short_comment;

  UserData({ this.uid, this.identity,this.username,this.name,this.age,this.disease,this.etel,this.ic,this.tel,this.first,this.payment_date,this.appointmentDate,this.short_comment});

}