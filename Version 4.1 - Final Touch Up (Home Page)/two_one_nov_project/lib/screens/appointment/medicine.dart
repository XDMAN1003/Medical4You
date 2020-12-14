import 'package:flutter/material.dart';

class Medicine extends StatelessWidget {
  final String medicine;
  final String quantity;
  Medicine({this.medicine,this.quantity});
  @override
  Widget build(BuildContext context) {
    if(medicine !=null){
      return  Padding(
          padding: EdgeInsets.fromLTRB(0,0,0,0.0),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 260,child: Text(medicine,style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300))),
                  //Spacer(),
                  Text(quantity,style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
                ],
              ),
              SizedBox(height:10.0),
            ],
          ));
    }
    else{
      return SizedBox(height:0);
    }
  }
}
