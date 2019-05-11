import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;
import 'behavior.dart';
import 'menu.dart';
import 'db.dart';

class Saved extends StatefulWidget{
  @override
  _Saved createState() => _Saved();
}

class _Saved extends State<Saved>{
  List<List<Widget>> _list = [List(),List(),List()];
  String _personalEntry = '';
  bool _summary = false;
  List<double> _listAngles = [0, 0, 0, 0];

  @override
  initState(){
    super.initState();
    _getAnswer();
  }

  _getAnswer() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> listString = pref.getStringList('Answers') ?? List();
    _personalEntry = pref.getString('PersonalEntry') ?? '';
    if(listString.isNotEmpty){
      List<int> listInt = listString.map(int.parse).toList();
      listInt.sort();
      _list = await DB().getList(listInt, _summary ? 'Summary' : 'Output');
      setState((){});
    }
  }

  _delete() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList('Answers', List());
    pref.setString('PersonalEntry', '');
    pref.setString('StoreTime', '1969-07-20 20:18:04Z');
  }

  _save() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('StoreTime', DateTime.now().add(Duration(days: 8)).toString());
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
                    SizedBox(height: 18.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              _summary = !_summary;
                            });
                            _getAnswer();
                          },
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Color.fromRGBO(255, 255, 255, _summary ? 0 : 1.0), width: 5.0)),
                                boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(78, 53, 43, 0.3),
                                  blurRadius: 20.0
                                )]
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: Text(
                                  'Detailed',
                                  style: TextStyle(color: !_summary ? Colors.white : Color.fromRGBO(78, 53, 43, 1), fontSize: 18.0, fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ),
                        ),
                        SizedBox(width: 27.0,),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              _summary = !_summary;
                            });
                            _getAnswer();
                          },
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Color.fromRGBO(255, 255, 255, _summary ? 1.0 : 0), width: 5.0)),
                                boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(78, 53, 43, 0.3),
                                  blurRadius: 20.0
                                )]
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: Text(
                                  'Summary',
                                  style: TextStyle(color: _summary ? Colors.white : Color.fromRGBO(78, 53, 43, 1), fontSize: 18.0, fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(246, 246, 246, 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(3.0)),
                            border: Border.all(color: Color.fromRGBO(112, 112, 112, 1), width: 1.0),
                            boxShadow: [BoxShadow(
                              color: Color.fromRGBO(78, 53, 43, 1.0),
                              blurRadius: 20.0
                            )],
                          ),
                          child: Stack(
                            children: <Widget>[
                              ExpansionTile(
                                title: Row(
                                  children: <Widget>[
                                    Transform(
                                        alignment: FractionalOffset.center,
                                        transform: Matrix4.rotationZ(_listAngles[0]),
                                        child: Icon(Icons.play_arrow, color: Color.fromRGBO(121, 85, 72, 1), size: 22.0,)
                                    ),
                                    SizedBox(width: 4.0,),
                                    Expanded(
                                      child: Text(
                                        'Sins Against God',
                                        style: TextStyle(color: Color.fromRGBO(78, 53, 43, 1), fontSize: 14.0, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: SizedBox(width: 0, height: 0),
                                onExpansionChanged: (value){
                                  setState(() {
                                    _listAngles[0] = value ? math.pi/2 : 0;
                                  });
                                },
                                children: _list[0],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12.0, left: 42.0),
                                child: Text(
                                  'Category: Sins Against',
                                  style: TextStyle(color: Color.fromRGBO(127, 127, 127, 1), fontSize: 8.0),
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 24.0),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(246, 246, 246, 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(3.0)),
                            border: Border.all(color: Color.fromRGBO(112, 112, 112, 1), width: 1.0),
                            boxShadow: [BoxShadow(
                                color: Color.fromRGBO(78, 53, 43, 1.0),
                                blurRadius: 20.0
                            )],
                          ),
                          child: Stack(
                            children: <Widget>[
                              ExpansionTile(
                                title: Row(
                                  children: <Widget>[
                                    Transform(
                                        alignment: FractionalOffset.center,
                                        transform: Matrix4.rotationZ(_listAngles[1]),
                                        child: Icon(Icons.play_arrow, color: Color.fromRGBO(121, 85, 72, 1), size: 22.0,)
                                    ),
                                    SizedBox(width: 4.0,),
                                    Expanded(
                                      child: Text(
                                        'Sins Against My Neighbor',
                                        style: TextStyle(color: Color.fromRGBO(78, 53, 43, 1), fontSize: 14.0, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: SizedBox(width: 0, height: 0),
                                onExpansionChanged: (value){
                                  setState(() {
                                    _listAngles[1] = value ? math.pi/2 : 0;
                                  });
                                },
                                children: _list[1],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12.0, left: 42.0),
                                child: Text(
                                  'Category: Sins Against',
                                  style: TextStyle(color: Color.fromRGBO(127, 127, 127, 1), fontSize: 8.0),
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 24.0),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(246, 246, 246, 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(3.0)),
                            border: Border.all(color: Color.fromRGBO(112, 112, 112, 1), width: 1.0),
                            boxShadow: [BoxShadow(
                                color: Color.fromRGBO(78, 53, 43, 1.0),
                                blurRadius: 20.0
                            )],
                          ),
                          child: Stack(
                            children: <Widget>[
                              ExpansionTile(
                                title: Row(
                                  children: <Widget>[
                                    Transform(
                                        alignment: FractionalOffset.center,
                                        transform: Matrix4.rotationZ(_listAngles[2]),
                                        child: Icon(Icons.play_arrow, color: Color.fromRGBO(121, 85, 72, 1), size: 22.0,)
                                    ),
                                    SizedBox(width: 4.0,),
                                    Expanded(
                                      child: Text(
                                        'Sins Against Myself',
                                        style: TextStyle(color: Color.fromRGBO(78, 53, 43, 1), fontSize: 14.0, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: SizedBox(width: 0, height: 0),
                                onExpansionChanged: (value){
                                  setState(() {
                                    _listAngles[2] = value ? math.pi/2 : 0;
                                  });
                                },
                                children: _list[2],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12.0, left: 42.0),
                                child: Text(
                                  'Category: Sins Against',
                                  style: TextStyle(color: Color.fromRGBO(127, 127, 127, 1), fontSize: 8.0),
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 24.0),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(246, 246, 246, 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(3.0)),
                            border: Border.all(color: Color.fromRGBO(112, 112, 112, 1), width: 1.0),
                            boxShadow: [BoxShadow(
                                color: Color.fromRGBO(78, 53, 43, 1.0),
                                blurRadius: 20.0
                            )],
                          ),
                          child: Stack(
                            children: <Widget>[
                              ExpansionTile(
                                title: Row(
                                  children: <Widget>[
                                    Transform(
                                        alignment: FractionalOffset.center,
                                        transform: Matrix4.rotationZ(_listAngles[3]),
                                        child: Icon(Icons.play_arrow, color: Color.fromRGBO(121, 85, 72, 1), size: 22.0,)
                                    ),
                                    SizedBox(width: 4.0,),
                                    Expanded(
                                      child: Text(
                                        'My sins…',
                                        style: TextStyle(color: Color.fromRGBO(78, 53, 43, 1), fontSize: 14.0, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: SizedBox(width: 0, height: 0),
                                onExpansionChanged: (value){
                                  setState(() {
                                    _listAngles[3] = value ? math.pi/2 : 0;
                                  });
                                },
                                children: [Padding(
                                  padding: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          _personalEntry,
                                          style: TextStyle(color: Color.fromRGBO(121, 85, 72, 1), fontSize: 12.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                )],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12.0, left: 42.0),
                                child: Text(
                                  'Category: Sins Against',
                                  style: TextStyle(color: Color.fromRGBO(127, 127, 127, 1), fontSize: 8.0),
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height: 80.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(121, 85, 72, 1),
                              borderRadius: BorderRadius.all(Radius.circular(4.0)),
                              border: Border.all(color: Color.fromRGBO(78, 53, 43, 1), width: 1.0),
                              boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.33),
                                  blurRadius: 6.0
                              )]
                          ),
                          child: Material(
                            type: MaterialType.transparency,
                            borderRadius: BorderRadius.all(Radius.circular(4.0)),
                            child: InkWell(
                              onTap: (){
                                showDialog(
                                    context: context,
                                    builder: (context) => Container(
                                      color: Color.fromRGBO(255, 255, 255, 0.8),
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
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 29.0, bottom: 43.0),
                                                      child: Text(
                                                        'You are about to delete the self-evaluation\n\nAre you sure you want to continue?',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(color: Color.fromRGBO(121, 85, 72, 1), fontSize: 14.0, fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: <Widget>[
                                                        Expanded(
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                border: Border(
                                                                  top: BorderSide(color: Colors.grey[200]),
                                                                  right: BorderSide(color: Colors.grey[200]),
                                                                ),
                                                              ),
                                                              child: Material(
                                                                color: Colors.white,
                                                                child: InkWell(
                                                                  onTap: (){
                                                                    _delete();
                                                                    Navigator.pop(context);
                                                                    Navigator.pushReplacementNamed(context, 'Menu');
                                                                  },
                                                                  child: Center(
                                                                    child: Padding(
                                                                      padding: EdgeInsets.all(14.0),
                                                                      child: Text(
                                                                        'Yes',
                                                                        style: TextStyle(color: Color.fromRGBO(38, 153, 251, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                        ),
                                                        Expanded(
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  border: Border(
                                                                      top: BorderSide(color: Colors.grey[200])
                                                                  )
                                                              ),
                                                              child: Material(
                                                                color: Colors.white,
                                                                child: InkWell(
                                                                  onTap: (){Navigator.pop(context);},
                                                                  child: Center(
                                                                    child: Padding(
                                                                      padding: EdgeInsets.all(14.0),
                                                                      child: Text(
                                                                        'No',
                                                                        style: TextStyle(color: Color.fromRGBO(38, 153, 251, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(child: Container())
                                        ],
                                      ),
                                    )
                                );
                              },
                              splashColor: Color.fromRGBO(121,85,72,0),
                              highlightColor: Color.fromRGBO(121,85,72,1),
                              child: Padding(
                                padding: EdgeInsets.only(top: 17.0, bottom: 17.0, left: 34.0, right: 34.0),
                                child: Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 13.0,),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(121, 85, 72, 1),
                            borderRadius: BorderRadius.all(Radius.circular(4.0)),
                            border: Border.all(color: Color.fromRGBO(78, 53, 43, 1), width: 1.0),
                            boxShadow: [BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.33),
                              blurRadius: 6.0
                            )]
                          ),
                          child: Material(
                            type: MaterialType.transparency,
                            borderRadius: BorderRadius.all(Radius.circular(4.0)),
                            child: InkWell(
                              onTap: (){
                                showDialog(
                                  context: context,
                                  builder: (context) => Container(
                                    color: Color.fromRGBO(255, 255, 255, 0.8),
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
                                                  Padding(
                                                    padding: EdgeInsets.only(top: 29.0, bottom: 33.0),
                                                    child: Text(
                                                      'Self-Evaluation has been saved and will\nself-destruct within 7 days on\n\n${DateFormat.yMMMMd("en_US").format(DateTime.now().add(Duration(days: 7)))}',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(color: Color.fromRGBO(121, 85, 72, 1), fontSize: 14.0, fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                  Divider(),
                                                  FlatButton(
                                                    child: Text(
                                                      'OK',
                                                      style: TextStyle(color: Color.fromRGBO(38, 153, 251, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold),
                                                    ),
                                                    onPressed: (){
                                                      _save();
                                                      Navigator.pop(context);
                                                      Navigator.pushReplacement(context, MaterialPageRoute(
                                                          builder: (context) => Menu(true)
                                                      ));
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(child: Container())
                                      ],
                                    ),
                                  )
                                );
                              },
                              splashColor: Color.fromRGBO(121,85,72,0),
                              highlightColor: Color.fromRGBO(121,85,72,1),
                              child: Padding(
                                padding: EdgeInsets.only(top: 17.0, bottom: 17.0, left: 34.0, right: 34.0),
                                child: Text(
                                  'Save',
                                  style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 36.0, left: 15.0, right: 15.0, bottom: 20.0),
                      child: Text(
                        'Note: Saved evaluations will self-destruct within 7 days as it meant to be used as a guide with your father of confession',
                        style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    )
                  ],
                ),
              ),
            ),
        ),
      ),
    );
  }
}