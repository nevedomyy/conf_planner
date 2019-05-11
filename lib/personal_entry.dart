import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'assessment.dart';
import 'behavior.dart';

class PersonalEntry extends StatefulWidget{
  @override
  _PersonalEntry createState() => _PersonalEntry();
}

class _PersonalEntry extends State<PersonalEntry>{
  TextEditingController _controller;

  @override
  initState(){
    super.initState();
    _controller = TextEditingController();
  }

  @override
  dispose(){
    super.dispose();
    _controller.dispose();
  }

  _save() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('PersonalEntry', _controller.text);
  }

  Widget _w(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top: 25.0, bottom: 16.0, left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'My sins...',
            style: TextStyle(color: Color.fromRGBO(127, 127, 127, 1), fontSize: 14.0),
          ),
          SizedBox(height: 6.0,),
          Container(
            height: 280.0,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(149, 152, 154, 1), width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(5.0))
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,
                cursorColor: Color.fromRGBO(121, 85, 72, 1.0),
                decoration: InputDecoration.collapsed(hintText: null),
                style: TextStyle(color: Color.fromRGBO(121, 85, 72, 1), fontSize: 16.0),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                maxLength: null,
              ),
            ),
          ),
          SizedBox(height: 12.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => Assessment('w5')
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    color: Color.fromRGBO(121, 85, 72, 1.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 17.0, bottom: 17.0, left: 28.0, right: 28.0),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              GestureDetector(
                onTap: (){
                  _save();
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => Assessment('w4')
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    color: Color.fromRGBO(121, 85, 72, 1.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 17.0, bottom: 17.0, left: 28.0, right: 28.0),
                    child: Text(
                      'Done',
                      style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(121, 85, 72, 1.0),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromRGBO(169, 130, 116, 1.0),
            appBar: AppBar(
                backgroundColor: Color.fromRGBO(121, 85, 72, 1.0),
                centerTitle: true,
                title: Text(
                  'Confession\nSelf Assessment',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                ),
                leading: IconButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, 'Menu');
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                )
            ),
            body: ScrollConfiguration(
              behavior: Behavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 48.0, left: 32.0, right: 32.0, bottom: 40.0),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(246, 246, 246, 1.0),
                              borderRadius: BorderRadius.all(Radius.circular(7.0)),
                              boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(78, 53, 43, 1.0),
                                  blurRadius: 30.0
                              )],
                            ),
                            child: _w(context)
                        )
                      ),
                    ),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}