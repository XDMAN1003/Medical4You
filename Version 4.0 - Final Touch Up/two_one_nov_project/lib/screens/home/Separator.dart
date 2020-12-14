import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_one_nov_project/models/booking.dart';
import 'package:two_one_nov_project/models/user.dart';
import 'package:two_one_nov_project/screens/Payment/payment_list.dart';
import 'package:two_one_nov_project/screens/appointment/app_list.dart';
import 'package:two_one_nov_project/screens/home/home.dart';
import 'package:two_one_nov_project/screens/setting/Setting.dart';
import 'package:two_one_nov_project/services/auth.dart';
import 'package:two_one_nov_project/services/database.dart';
class Homie extends StatefulWidget {
  Homie({
    Key key,
    this.index,
  }) : super(key: key);

  int index;
  @override
  _HomieState createState() => _HomieState(currentIndex: this.index);
}

class _HomieState extends State<Homie> {
  int currentIndex;

  _HomieState({this.currentIndex});

  List<Widget> children = [
    Home(),BookingList(),PaymentList(),Setting()
  ];

  @override
  Widget build(BuildContext context) {

    print(currentIndex);
    final AuthService _auth = AuthService();
    List<Widget> appBar = [
      AppBar(title: Text("Main Menu"),
        backgroundColor: Colors.deepOrange[300],
        centerTitle: true,
        actions: [RaisedButton.icon(onPressed: (){_auth.signOut();},
          icon: Icon(Icons.exit_to_app,color: Colors.white,),
          label: Text("Sign Out",style: TextStyle(color:Colors.white),),
          color: Colors.deepOrange[300],)],
      ),
      AppBar(title: Text("Schedule"),backgroundColor: Colors.deepOrange[300], centerTitle: true,
        leading: FlatButton(child: Icon(Icons.keyboard_arrow_left,size: 30.0,color: Colors.white,),
          minWidth: 20.0,
          onPressed: (){setState(() {
            currentIndex = 0;
          });},
        ),
      ),
      AppBar(title: Text("Payment"),backgroundColor: Colors.deepOrange[300], centerTitle: true,
        leading: FlatButton(child: Icon(Icons.keyboard_arrow_left,size: 30.0,color: Colors.white,),
          minWidth: 20.0,
          onPressed: (){setState(() {
            currentIndex = 0;
          });},
        ),
      ),
      AppBar(title: Text("Setting"),backgroundColor: Colors.deepOrange[300], centerTitle: true,
        leading: FlatButton(child: Icon(Icons.keyboard_arrow_left,size: 30.0,color: Colors.white,),
          minWidth: 20.0,
          onPressed: (){setState(() {
            currentIndex = 0;
          });},
        ),
      ),
    ];
    return Scaffold(
        appBar: appBar[currentIndex],
        body: children[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black38,
          selectedItemColor: Colors.deepOrange,
          backgroundColor: Colors.deepOrange,
          onTap: (int index){setState(() {
            currentIndex = index;
          });},
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon:Icon(Icons.home),title:Text("Home") ),
            BottomNavigationBarItem(icon:Icon(Icons.calendar_today_outlined),title:Text("Appointment")),
            BottomNavigationBarItem(icon:Icon(Icons.money),title:Text("Payment")),
            BottomNavigationBarItem(icon:Icon(Icons.settings),title:Text("Setting")),
          ],
        ),
    );
  }
}
