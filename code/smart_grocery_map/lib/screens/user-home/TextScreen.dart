import 'package:flutter/material.dart';
import 'package:smart_grocery_map/res/colors.dart';

class TextScreen extends StatelessWidget {

  final String s;
  final List info;
  const TextScreen({Key? key, required this.s, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:  AppBar(
        title: Text("Search Result"),
        backgroundColor: yellow,
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child:
            Text("Information of:    "+s+"\n"
                +"Company:    "+info[1]+"\n"
            +"Product Name:    "+info[2]+"\n"
            +"Product Type:    "+info[3]+"\n"
            +"Description:    "+info[4]+"\n"
            +"Price:    "+info[5].toString()+"\n"
            +"Location: Aisle: "+info[6].toString()+" Shelf: "+info[7].toString()),
          )
      ),
    );
  }
}