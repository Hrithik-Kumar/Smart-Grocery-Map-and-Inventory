import 'package:flutter/material.dart';
import 'ProfilePage.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: RaisedButton(
              child: Text('Click to See Profile'),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new ProfilePage()));
              },
            ),
          ),
        ],
      ),
    );
  }
}