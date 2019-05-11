import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'db.dart';
import 'assessment.dart';
import 'add_your_own.dart';
import 'behavior.dart';

class Question extends StatefulWidget{
  int _index;
  Question(this._index);
  @override
  _Question createState() => _Question(_index);
}

class _Question extends State<Question>{
  List<String> _list = ['','','','','',''];
  int _index;
  String _questionLength = '';

  _Question(int index){
    this._index = index;
    _getFromDB(index);
  }

  _getFromDB(int index) async{
    _list = await DB().get(index);
    if(_index < 16) _questionLength = 'Question $_index of 15';
    if(_index > 15 && _index < 40) _questionLength = 'Question ${_index-15} of 24';
    if(_index > 39) _questionLength = 'Question ${_index-39} of 14';
    setState(() {});
  }

  _saveAnswer(int index) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> list = pref.getStringList('Answers') ?? List();
    if (!list.contains(index.toString())) {
      list.add(index.toString());
      pref.setStringList('Answers', list);
    }
  }

  _removeAnswer(int index) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> list = pref.getStringList('Answers') ?? List();
    if (list.contains(index.toString())) {
      list.remove(index.toString());
      pref.setStringList('Answers', list);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(121, 85, 72, 1.0),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromRGBO(246, 246, 246, 1.0),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 12.0, left: 12.0),
                      child: Text(
                          'Category (sins against...):',
                          style: TextStyle(color: Color.fromRGBO(180, 180, 180, 1), fontSize: 12.0)
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Text(
                        _list[2],
                        style: TextStyle(color: Color.fromRGBO(127, 127, 127, 1), fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 35.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          _questionLength,
                          style: TextStyle(color: Color.fromRGBO(38, 153, 251, 1), fontSize: 14.0),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 24.0, right: 24.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            border: Border.all(
                              color: Color.fromRGBO(199, 199, 199, 0.5),
                              width: 1.0,
                            ),
                            boxShadow: [BoxShadow(
                              color: Color.fromRGBO(231, 231, 231, 1),
                              blurRadius: 30.0
                            )],
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Related to:',
                                style: TextStyle(color: Color.fromRGBO(180, 180, 180, 1), fontSize: 10.0),
                              ),
                              Text(
                                _list[3],
                                style: TextStyle(color: Color.fromRGBO(127, 127, 127, 1), fontSize: 14.0),
                              ),
                              Divider(),
                              SizedBox(height: 20.0),
                              Text(
                                _list[0],
                                style: TextStyle(color: Color.fromRGBO(121, 85, 72, 1), fontSize: 18.0),
                              ),
                              SizedBox(height: 40.0,),
                              Center(
                                child: Text(
                                  'This is related to the Third Commandment:',
                                  style: TextStyle(color: Color.fromRGBO(112, 112, 112, 1), fontSize: 12.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                                ),
                              ),
                              Center(
                                child: Text(
                                  _list[5],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Color.fromRGBO(112, 112, 112, 1), fontSize: 12.0, fontStyle: FontStyle.italic),
                                ),
                              ),
                              SizedBox(height: 20.0,),
                              Divider(),
                              Text(
                                'Summarized as:',
                                style: TextStyle(color: Color.fromRGBO(180, 180, 180, 1), fontSize: 10.0),
                              ),
                              Text(
                                _list[4],
                                style: TextStyle(color: Color.fromRGBO(127, 127, 127, 1), fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 34.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Material(
                          color:  Colors.white,
                          child: InkWell(
                            onTap: (){
                              _saveAnswer(_index);
                              switch(_index){
                                case 15: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Assessment('w2'))); break;
                                case 39: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Assessment('w3'))); break;
                                case 53: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddYourOwn())); break;
                                default: _index++; _getFromDB(_index);
                              }
                            },
                            splashColor: Color.fromRGBO(121, 85, 72, 0),
                            highlightColor: Color.fromRGBO(121, 85, 72, 0.4),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                border: Border.all(color: Color.fromRGBO(121, 85, 72, 1), width: 1.0)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top: 15.0, bottom: 15.0, left: 38.0, right: 38.0),
                                child: Text(
                                  'YES',
                                  style: TextStyle(color: Color.fromRGBO(121, 85, 72, 1), fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0,),
                        Material(
                          color: Colors.white,
                          child: InkWell(
                            onTap: (){
                              _removeAnswer(_index);
                              switch(_index){
                                case 15: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Assessment('w2'))); break;
                                case 39: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Assessment('w3'))); break;
                                case 53: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddYourOwn())); break;
                                default: _index++; _getFromDB(_index);
                              }
                            },
                            splashColor: Color.fromRGBO(121, 85, 72, 0),
                            highlightColor: Color.fromRGBO(121, 85, 72, 0.4),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                border: Border.all(color: Color.fromRGBO(121, 85, 72, 1), width: 1.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top: 15.0, bottom: 15.0, left: 38.0, right: 38.0),
                                child: Text(
                                  'NO',
                                  style: TextStyle(color: Color.fromRGBO(121, 85, 72, 1), fontSize: 10.0, fontWeight: FontWeight.bold),
                                ),
                              )
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Color.fromRGBO(121, 85, 72, 1.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      splashColor: Color.fromRGBO(78, 53, 43, 0),
                      highlightColor: Color.fromRGBO(78, 53, 43, 1),
                      onTap: (){
                        if(_index != 1 && _index != 16 && _index != 40){
                          _index--;
                          _getFromDB(_index);
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 15.0, bottom: 15.0, left: 40.0, right: 40.0),
                        child: Text(
                          'Previous',
                          style: TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.bold),
                        ),
                      )
                    ),
                    SizedBox(width: 20.0),
                    InkWell(
                      splashColor: Color.fromRGBO(78, 53, 43, 0),
                      highlightColor: Color.fromRGBO(78, 53, 43, 1),
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
                                            SizedBox(height: 30.0),
                                            Text(
                                              'You did not finish the section:',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(color: Color.fromRGBO(121, 85, 72, 1), fontSize: 14.0, fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 14.0),
                                            Text(
                                              _list[2],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(color: Color.fromRGBO(33, 72, 151, 1), fontSize: 14.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                                            ),
                                            SizedBox(height: 14.0),
                                            Text(
                                              'Would you like submit\nand continue the next section?',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(color: Color.fromRGBO(121, 85, 72, 1), fontSize: 14.0, fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 30.0),
                                            Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                          top: BorderSide(color: Colors.grey[200]),
                                                          right: BorderSide(color: Colors.grey[200]),
                                                        )
                                                    ),
                                                    child: Material(
                                                      color: Colors.white,
                                                      child: InkWell(
                                                        onTap: (){
                                                          Navigator.pop(context);
                                                          if(_index < 16) Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Assessment('w2')));
                                                          if(_index > 15 && _index < 40) Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Assessment('w3')));
                                                          if(_index > 39) Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddYourOwn()));
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
                      child: Padding(
                        padding: EdgeInsets.only(top: 15.0, bottom: 15.0, left: 40.0, right: 40.0),
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.bold),
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ),
        ),
      ),
    );
  }
}