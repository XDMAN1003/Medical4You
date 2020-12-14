import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:two_one_nov_project/models/booking.dart';
import 'package:two_one_nov_project/models/medical.dart';
import 'package:two_one_nov_project/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference personal_Info = Firestore.instance.collection('personal_info');

  Future<void> updateUserData(String username,String name, String age, String ic,String disease,String tel, String etel, String identity) async {
    return await personal_Info.document(uid).setData({
      'username': username,
      'name': name,
      'age': age,
      'ic': ic,
      'disease': disease,
      'tel': tel,
      'etel': etel,
      'identity': identity,
      'first': true,
    });
  }
  Future<void> notFirstTime() async {
    return await personal_Info.document(uid).updateData({
      'first': false,
    });
  }


  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      username: snapshot.data['username'],
      name: snapshot.data['name'],
      age: snapshot.data['age'],
      ic: snapshot.data['ic'],
      disease: snapshot.data['disease'],
      tel: snapshot.data['tel'],
      etel: snapshot.data['etel'],
      identity: snapshot.data['identity'],
      first: snapshot.data["first"],
      payment_date: snapshot.data["payment_date"],
      appointmentDate: snapshot.data["app_date"],
      short_comment: snapshot.data["short_comment"],
    );
  }

  // get user doc stream
  Stream<UserData> get userData {
    return personal_Info.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

  //Add Medical Card Info
  final CollectionReference medical_info = Firestore.instance.collection('medical_info');

  Future<void> updateMedicData(String medical_record,String allergies,String medicine,String bloodType) async {
    return await Firestore.instance.collection('medical_info').document(uid).setData({
      'medical_record': medical_record,
      'allergies': allergies,
      'medicine': medicine,
      'blood_type': bloodType,
    });
  }

  MedicalData _medicalInfoFromSnapshot(DocumentSnapshot snapshot) {
    return MedicalData(
        medical_record: snapshot.data['medical_record'],
        allergies: snapshot.data['allergies'],
        medicine: snapshot.data['medicine'],
        bloodType: snapshot.data['blood_type']
    );
  }

  Stream<MedicalData> get medicalData {
    return Firestore.instance.collection('medical_info').document(uid).snapshots()
        .map(_medicalInfoFromSnapshot);
  }

  // Appointment collection reference
  // Collection - update Appointment Data
  Future<void> updateAppData(String appDate, String appTime, String appDoctor,String address, String doc_note) async {

    await personal_Info.document(uid).updateData({
      'app_date': appDate,
    });
    return await Firestore.instance.collection("appointment_"+uid).document(appDate).setData({
      'appDate': appDate,
      'appTime': appTime,
      'appDoctor': appDoctor,
      'address': address,
      'doc_note': doc_note,
      'status': 'pending',
    });
  }
  // brew list from snapshot
  List<Booking> _bookingFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      print(doc.data);
      return Booking(
          app_date: doc.data['appDate'] ?? DateTime.now(),
          app_time: doc.data['appTime'] ?? "10:03 (10:30am)",
          doctor: doc.data['appDoctor'] ?? "Still Finding Doctor",
          address: doc.data['address'] ?? "UTM, Skudai,Johor",
          doc_note: doc.data['doc_note'] ?? '',
          month: doc.data['month'],
          status: doc.data['status'],
      );
    }).toList();
  }

  // get brews stream
  Stream<List<Booking>> get booking_info {
    return Firestore.instance.collection("appointment_"+uid).snapshots()
        .map(_bookingFromSnapshot);
  }

  //Health Report
  Future<void> updateHealthReport(String appDate,String medicine,String medicine1,String medicine2,String quantity,String quantity1,String quantity2,String shortComment,String docComment) async {

    await personal_Info.document(uid).updateData({
      'short_comment': shortComment,
    });
    return await Firestore.instance.collection("appointment_"+uid).document(appDate).updateData({
      'medicine': medicine,
      'medicine1': medicine1,
      'medicine2': medicine2,
      'quantity': quantity,
      'quantity1': quantity1,
      'quantity2': quantity2,
      'status': "completed",
      'price': 0.0,
      'price1': 0.0,
      'price2': 0.0,
      'paid': "processing",
      'shortComment': shortComment,
      'doc_comment': docComment
    });
  }

  //Bill Report
  Future<void> updateBillReport(String appDate, String paymentMethod, String paymentSelection, String seriesNum) async {
    await personal_Info.document(uid).updateData({
      'payment_date': DateFormat('dd MMMM yyyy').format(DateTime.now()) ,
    });
    return await Firestore.instance.collection("appointment_"+uid).document(appDate).updateData({
      'paid': "paid",
      'payment_method': paymentMethod,
      'series_num': seriesNum,
      'payment_select': paymentSelection,
    });
  }

}