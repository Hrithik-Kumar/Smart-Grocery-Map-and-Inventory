import 'package:flutter/material.dart';
import '/screens/auxiliary/ProfilePage.dart';

class UserScreen extends StatelessWidget {
  Widget createTitle(var input) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 0.0,
          ),
          child: Text(
            input,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 80.0,
        ),
        child: Column(
          children: [
            createTitle('Account'),
            Row(
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new ProfilePage()));
                  },
                  icon: Icon(Icons.local_convenience_store_rounded),
                  label: Text("Company Name\nView Profile"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    onPrimary: Colors.black,
                    shadowColor: Colors.transparent,
                    alignment: Alignment(0,0),
                  ),
                ),
              ],
            ),
            createTitle('Settings'),
          ]
        )
        
      ),
    );
  }
}