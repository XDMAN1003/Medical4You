import 'package:flutter/material.dart';

class EmergencyCall extends StatefulWidget {
  @override
  _EmergencyCallState createState() => _EmergencyCallState();
}

class _EmergencyCallState extends State<EmergencyCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[400],
        title: Text(
          'Emergency Call',
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 30.0,),
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/emergency_call.png"),
              radius: 70.0,
            ),
          ),
          SizedBox(height:20.0),
          Center(
            child: Text(
              'Emergency Call',
              style: TextStyle(
                color: Colors.grey[100],
                fontSize: 30.0,
              ),
            ),
          ),
          SizedBox(height:15.0),
          Center(
            child: Text(
              'Calling...',
              style: TextStyle(
                color: Colors.grey[100],
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(height:80.0),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: RawMaterialButton(
                  onPressed: (){},
                  elevation: 2.0,
                  fillColor: Colors.grey[300],
                  child: Icon(
                    Icons.mic_off,
                    size: 60.0,
                  ),
                  shape: CircleBorder(),
                ),
              ),
              Expanded(
                flex: 1,
                child: RawMaterialButton(
                  onPressed: (){},
                  elevation: 2.0,
                  fillColor: Colors.grey,
                  child: Icon(
                    Icons.volume_up,
                    size: 60.0,
                  ),
                  shape: CircleBorder(),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  child: Center(
                    child: Text(
                      'Mute',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Center(
                    child: Text(
                      'Speaker',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25.0),
          Center(
            child: RawMaterialButton(
              padding: EdgeInsets.all(5.0),
              onPressed: () {},
              elevation: 2.0,
              fillColor: Colors.red[700],
              child: Icon(
                Icons.call_end,
                size: 65.0,
                color: Colors.white,
              ),
              shape: CircleBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
