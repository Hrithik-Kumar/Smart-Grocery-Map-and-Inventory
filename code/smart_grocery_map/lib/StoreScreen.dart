import 'package:flutter/material.dart';
import 'database_helper.dart';

class StoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          OutlinedButton(onPressed: (){ DatabaseHelper.connectToDatabase(); }, child: Text("connect to database")),
          const SizedBox(height: 50),
          OutlinedButton(onPressed: (){ DatabaseHelper.getTableItems(); }, child: Text("get table items")),
          const SizedBox(height: 50),
          OutlinedButton(onPressed: (){ DatabaseHelper.disconnectFromDatabase(); }, child: Text("disconnect from database"))
        ],
      ), 
    );
  }
}