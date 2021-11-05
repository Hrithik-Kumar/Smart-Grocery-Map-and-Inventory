import 'package:flutter/material.dart';

class TextScreen extends StatelessWidget {

  final String s;
  const TextScreen({Key? key, required this.s}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return new Scaffold(
      appBar:  AppBar(
        title: Text("searching result page:"),
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Text("Here, you will look at the information of:        "+s),
          )
      ),
    );
  }
}