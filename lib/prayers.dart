import 'package:flutter/material.dart';
import 'prayers_item.dart';

class Prayers extends StatelessWidget{

  Widget _items(BuildContext context, String text){
    return ListTile(
      contentPadding: EdgeInsets.all(0.0),
      onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => PrayersItem(text)
        ));
      },
      title: Text(
        text,
        style: TextStyle(color: Color.fromRGBO(121, 85, 72, 1.0), fontSize: 14.0),
      ),
    );
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
              'Confessional Prayers',
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
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 80.0, left: 16.0, right: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(
                        color: Color.fromRGBO(169, 130, 116, 0.5),
                        width: 1.0,
                      ),
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(17.0),
                    child: Column(
                      children: <Widget>[
                        _items(context, 'Prayer for Repentance'),
                        Divider(),
                        _items(context, 'Prayer Before Confession'),
                        Divider(),
                        _items(context, 'Prayer After Confession'),
                        Divider(),
                        _items(context, 'Psalm 50'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}