import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:core';

class Menu extends StatefulWidget{
  bool _thirdMenu;
  Menu(this._thirdMenu);
  @override
  _Menu createState() => _Menu(_thirdMenu);

}

class _Menu extends State<Menu> with WidgetsBindingObserver{
  bool _thirdMenu;
  String _difDays = '';

  _Menu(this._thirdMenu);

  @override
  initState(){
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _init();
  }

  @override
  dispose(){
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  didChangeAppLifecycleState(AppLifecycleState state){
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.resumed) _init();
  }

  _init() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String oldTimePref =  pref.getString('StoreTime') ?? '1969-07-20 20:18:04Z';
    DateTime oldTime = DateTime.parse(oldTimePref);
    DateTime newTime = DateTime.now();
    var difference = oldTime.difference(newTime);
    if(difference.inDays > 0) {
      _thirdMenu = true;
      _difDays = difference.inDays.toString();
      setState(() {});
    }
  }

  Widget _item(BuildContext context, String text, String goTo, String img){
    return Padding(
      padding: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(
                color: Color.fromRGBO(121, 85, 72, 0.5),
                blurRadius: 30.0
            )]
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: (){
              Navigator.pushReplacementNamed(context, goTo);
            },
            splashColor: Color.fromRGBO(218,188,177,0),
            highlightColor: Color.fromRGBO(218,188,177,1),
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color.fromRGBO(121, 85, 72, 1.0), width: 1.0),
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                          child: SvgPicture.asset('assets/$img', color: Color.fromRGBO(169, 130, 116, 1.0), allowDrawingOutsideViewBox: false)
                      )
                  ),
                  Center(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              text,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color.fromRGBO(121, 85, 72, 1.0), fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),goTo == 'Saved' ? Text(
                              'To be used for Confessions',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color.fromRGBO(121, 85, 72, 1.0), fontSize: 16.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                            ): Container(),
                            goTo == 'Saved' ? Text(
                              '(Expiring in ${_difDays}days)',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.redAccent, fontSize: 16.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                            ): Container()
                          ],
                        )
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(246, 246, 246, 1.0),
      child: SafeArea(
        child: Material(
          child: Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    'CONFESSION\nPlanner',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color.fromRGBO(78, 53, 43, 1.0), fontSize: 45.0, fontFamily: 'GFSNICEFORE'),
                  ),
                ),
              ),
              Expanded(child: Container(),),
              _item(context, 'CONFESIONAL\nPRAYERS', 'Prayers', 'ico_01.svg'),
              _item(context, 'SELF\nASSESSMENT', 'Assessment', 'ico_02.svg'),
              _thirdMenu ? _item(context, 'SAVED SELF-EVALUATION', 'Saved', 'ico_03.svg') : Container(),
              Expanded(child: Container(),),
            ],
          ),
        )
      ),
    );
  }
}