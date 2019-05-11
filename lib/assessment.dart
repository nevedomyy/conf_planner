import 'package:flutter/material.dart';
import 'question.dart';

class Assessment extends StatelessWidget{
  final String _widget;

  Assessment(this._widget);

  Widget _w(BuildContext context){
    switch(_widget){
      case 'w2': return _w2(context);
      case 'w3': return _w3(context);
      case 'w4': return _w4(context);
      case 'w5': return _w5(context);
    }
    return _w1(context);
  }

  Widget _w1(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top: 41.0, bottom: 36.0, left: 32.0, right: 32.0),
      child: Column(
        children: <Widget>[
          Text(
            'This guideline is divided into three categories to help with the self-evaluation:\n\n\nSins against God\nSins against my neighbors\nSins against myself',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromRGBO(121, 85, 72, 1.0), fontSize: 14.0),
          ),
          Padding(
            padding: EdgeInsets.only(top: 48.0, bottom: 29.0),
            child: Text(
              'BEGIN\nSelf-Evaluation: Sins Against God',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromRGBO(38, 130, 251, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => Question(1)
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                color: Color.fromRGBO(121, 85, 72, 1.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 17.0, bottom: 17.0, left: 60.0, right: 60.0),
                child: Text(
                  'Start',
                  style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _w2(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top: 41.0, bottom: 36.0, left: 32.0, right: 32.0),
      child: Column(
        children: <Widget>[
          Text(
            'This guideline is divided into three categories to help with the self-evaluation: Sins against God; Sins against my neighbors; Sins against myself',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromRGBO(121, 85, 72, 1.0), fontSize: 10.0),
          ),
          SizedBox(height: 29.0),
          Row(
            children: <Widget>[
              Icon(Icons.done, color: Color.fromRGBO(38, 153, 251, 1), size: 40.0,),
              SizedBox(width: 10.0),
              Flexible(
                child: Text(
                  'You just completed:\nSelf-Evaluation: Sings Against God',
                  style: TextStyle(color: Color.fromRGBO(127, 127, 127, 1), fontSize: 12.0),
                  softWrap: true,
                ),
              )
            ],
          ),
          SizedBox(height: 118.0),
          Padding(
            padding: EdgeInsets.only(bottom: 29.0),
            child: Text(
              'BEGIN\nSelf-Evaluation: Sins Against my Neighbors',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromRGBO(38, 130, 251, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => Question(16)
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                color: Color.fromRGBO(121, 85, 72, 1.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 17.0, bottom: 17.0, left: 60.0, right: 60.0),
                child: Text(
                  'Start',
                  style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _w3(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top: 41.0, bottom: 36.0, left: 32.0, right: 32.0),
      child: Column(
        children: <Widget>[
          Text(
            'This guideline is divided into three categories to help with the self-evaluation: Sins against God; Sins against my neighbors; Sins against myself',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromRGBO(121, 85, 72, 1.0), fontSize: 10.0),
          ),
          SizedBox(height: 29.0),
          Row(
            children: <Widget>[
              Icon(Icons.done, color: Color.fromRGBO(38, 153, 251, 1), size: 40.0,),
              SizedBox(width: 10.0),
              Flexible(
                child: Text(
                  'You just completed:\nSelf-Evaluation: Sings Against God',
                  style: TextStyle(color: Color.fromRGBO(127, 127, 127, 1), fontSize: 12.0),
                  softWrap: true,
                ),
              )
            ],
          ),
          SizedBox(height: 22.0),
          Row(
            children: <Widget>[
              Icon(Icons.done, color: Color.fromRGBO(38, 153, 251, 1), size: 40.0,),
              SizedBox(width: 10.0),
              Flexible(
                child: Text(
                  'You just completed:\nSelf-Evaluation: Sings Against my Neighbors',
                  style: TextStyle(color: Color.fromRGBO(127, 127, 127, 1), fontSize: 12.0),
                  softWrap: true,
                ),
              )
            ],
          ),
          SizedBox(height: 62.0),
          Padding(
            padding: EdgeInsets.only(bottom: 29.0),
            child: Text(
              'BEGIN\nSelf-Evaluation: Sins Against Myself',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromRGBO(38, 130, 251, 1.0), fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => Question(40)
              ));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                color: Color.fromRGBO(121, 85, 72, 1.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 17.0, bottom: 17.0, left: 60.0, right: 60.0),
                child: Text(
                  'Start',
                  style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _w4(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top: 41.0, bottom: 23.0, left: 32.0, right: 32.0),
      child: Column(
        children: <Widget>[
          Text(
            'This guideline is divided into three categories to help with the self-evaluation: Sins against God; Sins against my neighbors; Sins against myself',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromRGBO(121, 85, 72, 1.0), fontSize: 10.0),
          ),
          SizedBox(height: 29.0),
          Row(
            children: <Widget>[
              Icon(Icons.done, color: Color.fromRGBO(38, 153, 251, 1), size: 40.0,),
              SizedBox(width: 10.0),
              Flexible(
                child: Text(
                  'You just completed:\nSelf-Evaluation: Sings Against God',
                  style: TextStyle(color: Color.fromRGBO(127, 127, 127, 1), fontSize: 12.0),
                  softWrap: true,
                ),
              )
            ],
          ),
          SizedBox(height: 22.0),
          Row(
            children: <Widget>[
              Icon(Icons.done, color: Color.fromRGBO(38, 153, 251, 1), size: 40.0,),
              SizedBox(width: 10.0),
              Flexible(
                child: Text(
                  'You just completed:\nSelf-Evaluation: Sings Against my Neighbors',
                  style: TextStyle(color: Color.fromRGBO(127, 127, 127, 1), fontSize: 12.0),
                  softWrap: true,
                ),
              )
            ],
          ),
          SizedBox(height: 22.0),
          Row(
            children: <Widget>[
              Icon(Icons.done, color: Color.fromRGBO(38, 153, 251, 1), size: 40.0,),
              SizedBox(width: 10.0),
              Flexible(
                child: Text(
                  'You just completed:\nSelf-Evaluation: Sings Against Myself',
                  style: TextStyle(color: Color.fromRGBO(127, 127, 127, 1), fontSize: 12.0),
                  softWrap: true,
                ),
              )
            ],
          ),
          SizedBox(height: 22.0),
          Row(
            children: <Widget>[
              Icon(Icons.done, color: Color.fromRGBO(38, 153, 251, 1), size: 40.0,),
              SizedBox(width: 10.0),
              Flexible(
                child: Text(
                  'Personal Entry',
                  style: TextStyle(color: Color.fromRGBO(127, 127, 127, 1), fontSize: 12.0),
                  softWrap: true,
                ),
              )
            ],
          ),
          SizedBox(height: 40.0),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacementNamed(context, 'Saved');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                color: Color.fromRGBO(121, 85, 72, 1.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 17.0, bottom: 17.0, left: 8.0, right: 8.0),
                child: Text(
                  'Create Report',
                  style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _w5(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top: 41.0, bottom: 23.0, left: 32.0, right: 32.0),
      child: Column(
        children: <Widget>[
          Text(
            'This guideline is divided into three categories to help with the self-evaluation: Sins against God; Sins against my neighbors; Sins against myself',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromRGBO(121, 85, 72, 1.0), fontSize: 10.0),
          ),
          SizedBox(height: 29.0),
          Row(
            children: <Widget>[
              Icon(Icons.done, color: Color.fromRGBO(38, 153, 251, 1), size: 40.0,),
              SizedBox(width: 10.0),
              Flexible(
                child: Text(
                  'You just completed:\nSelf-Evaluation: Sings Against God',
                  style: TextStyle(color: Color.fromRGBO(127, 127, 127, 1), fontSize: 12.0),
                  softWrap: true,
                ),
              )
            ],
          ),
          SizedBox(height: 22.0),
          Row(
            children: <Widget>[
              Icon(Icons.done, color: Color.fromRGBO(38, 153, 251, 1), size: 40.0,),
              SizedBox(width: 10.0),
              Flexible(
                child: Text(
                  'You just completed:\nSelf-Evaluation: Sings Against my Neighbors',
                  style: TextStyle(color: Color.fromRGBO(127, 127, 127, 1), fontSize: 12.0),
                  softWrap: true,
                ),
              )
            ],
          ),
          SizedBox(height: 22.0),
          Row(
            children: <Widget>[
              Icon(Icons.done, color: Color.fromRGBO(38, 153, 251, 1), size: 40.0,),
              SizedBox(width: 10.0),
              Flexible(
                child: Text(
                  'You just completed:\nSelf-Evaluation: Sings Against Myself',
                  style: TextStyle(color: Color.fromRGBO(127, 127, 127, 1), fontSize: 12.0),
                  softWrap: true,
                ),
              )
            ],
          ),
          SizedBox(height: 105.0),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacementNamed(context, 'Saved');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                color: Color.fromRGBO(121, 85, 72, 1.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 17.0, bottom: 17.0, left: 8.0, right: 8.0),
                child: Text(
                  'Create Report',
                  style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
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
                ),
            ),
            body: Column(
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
            )
        ),
      ),
    );
  }
}