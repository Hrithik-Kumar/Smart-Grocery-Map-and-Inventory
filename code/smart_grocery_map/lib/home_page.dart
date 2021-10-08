import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  static String tag="home_page";

  @override
  Widget build(BuildContext context) {

    final welcome=Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome! This is Smart Grocery Home Page',
        style: new TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    );

    final info=Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "You have already logged in！Feel free to explore other features.",
        style: new TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    );

    final body=Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.lightBlueAccent
              ]
          )
      ),
      child: Column(children: <Widget>[
        welcome, info,
      ],),
    );

    return Scaffold(
      body: body,
    );
  }

}