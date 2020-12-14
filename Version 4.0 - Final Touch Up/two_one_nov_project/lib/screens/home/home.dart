import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:two_one_nov_project/models/user.dart';
import 'package:two_one_nov_project/screens/function/Appointment.dart';
import 'package:two_one_nov_project/screens/home/Emergency.dart';
import 'package:two_one_nov_project/screens/home/Separator.dart';
import 'package:two_one_nov_project/services/auth.dart';
import 'package:two_one_nov_project/services/database.dart';
import 'package:two_one_nov_project/shared/loading.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    setState(() {
      print("Home Page:");
      print(user.uid);
    });
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          print("My home page");
          print(snapshot.data);
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Welcome back, ${userData.username}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20.0),
                      Center(
                        child: Stack(children: [
                          Container(
                            child: ClipRRect(
                              child: Opacity(
                                  opacity: 0.80,
                                  child: Image.network(
                                    "https://images.pexels.com/photos/2236713/pexels-photo-2236713.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                                    fit: BoxFit.fill,
                                  )),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            height: MediaQuery.of(context).size.height / 4,
                            decoration: BoxDecoration(
                                color: Color(0xffa29bfe),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.8),
                                    spreadRadius: 5,
                                    blurRadius: 18,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(16)),
                          ),
                          Positioned(
                              left: 5,
                              top: 10,
                              child: Icon(Icons.local_hospital_rounded,
                                  size: 50.0, color: Colors.white)),
                          Positioned(
                              left: 65,
                              top: 22,
                              child: Text(
                                "Patient Infomation",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                          Positioned(
                              left: 10,
                              top: 90,
                              child: Text(
                                "${userData.name}",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                          Positioned(
                              left: 10,
                              top: 70,
                              child: Text(
                                "${userData.identity}",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                          Positioned(
                              left: 10,
                              top: 130,
                              child: Icon(Icons.volunteer_activism,
                                  color: Colors.white, size: 25.0)),
                          Positioned(
                              left: 40,
                              top: 130,
                              child: Text(
                                "${userData.disease}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                          Positioned(
                              bottom: 10,
                              right: 10,
                              child: Text(
                                  "Copyright © 2020, Medical4You. All Rights Reserved",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white)))
                        ]),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Notification",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      SizedBox(
                        width: double.infinity,
                        height: 70.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.redAccent[400],
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15, 5.0, 20.0, 10.0),
                                child: Icon(
                                  Icons.local_hospital_outlined,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0, 10.0, 0.0, 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Health Report",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      SizedBox(height:7.0),
                                      Text(userData.short_comment,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                              FlatButton(
                                  minWidth: 40.0,
                                  height: 50.0,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => (Homie(index:1))));
                                  },
                                  child: Icon(
                                    Icons.chevron_right,
                                    size: 35.0,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      SizedBox(
                        width: double.infinity,
                        height: 70.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.pinkAccent[200],
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15, 5.0, 20.0, 10.0),
                                child: Icon(
                                  Icons.calendar_today_rounded,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0, 10.0, 0.0, 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Appointment",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      SizedBox(height:7.0),
                                      Text(DateFormat('dd MMMM yyyy').format(userData.appointmentDate.toDate()),
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                              FlatButton(
                                  minWidth: 40.0,
                                  height: 50.0,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => (Appointment())));
                                  },
                                  child: Icon(
                                    Icons.chevron_right,
                                    size: 35.0,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      SizedBox(
                        width: double.infinity,
                        height: 70.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent[400],
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15, 5.0, 20.0, 10.0),
                                child: Icon(
                                  Icons.monetization_on_outlined,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0, 10.0, 0.0, 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Payment",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      SizedBox(height:7.0),
                                      Text(userData.payment_date,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                              FlatButton(
                                  minWidth: 40.0,
                                  height: 50.0,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => (Homie(index:2))));
                                  },
                                  child: Icon(
                                    Icons.chevron_right,
                                    size: 35.0,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 70.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent[400],
                              borderRadius: BorderRadius.circular(10.0)),
                          child: FlatButton(
                            onLongPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => (EmergencyCall())));
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      5, 5.0, 20.0, 10.0),
                                  child: Icon(
                                    Icons.call,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 10.0, 0.0, 10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Emergency Contact",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        SizedBox(height:7.0),
                                        Text("${userData.etel}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7.0,
                      ),
                      Center(
                          child: Text(
                        "App is created by Medical4You Team",
                        style: TextStyle(color: Colors.grey[400]),
                      ))
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
