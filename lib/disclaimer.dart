import 'package:flutter/material.dart';
import 'db.dart';

class Disclaimer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(246, 246, 246, 1.0),
      child: Column(
        children: <Widget>[
          Expanded(child: Container()),
          Padding(
            padding: EdgeInsets.all(40.0),
            child: Material(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color.fromRGBO(149, 152, 154, 1.0), width: 1.0),
                  boxShadow: [BoxShadow(color: Color.fromRGBO(169, 130, 116, 0.5), blurRadius: 30.0)]
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 32.0),
                    Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'This Confession Planner is intended for persons above 13 years of age to aid the repentant person with their confession with his/her father of confession. By no means does it replace receiving the absolution from the priest.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color.fromRGBO(121, 85, 72, 1.0), fontSize: 16.0),
                      ),
                    ),
                    Divider(),
                    FlatButton(
                      onPressed: (){
                        DB().init();
                        Navigator.pushReplacementNamed(context, 'Menu');
                      },
                      child: Text(
                        'OK',
                        style: TextStyle(color: Color.fromRGBO(38, 153, 251, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: Container())
        ],
      )
    );
  }
}