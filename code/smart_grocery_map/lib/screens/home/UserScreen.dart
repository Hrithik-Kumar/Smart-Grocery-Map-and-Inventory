import 'package:flutter/material.dart';
import '/screens/auxiliary/ProfilePage.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 80.0,
        ),
        child: Row(
          
          children: <Widget>[
            Expanded(
              flex:1,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new ProfilePage()));
                },
                icon: Icon(Icons.local_convenience_store_rounded),
                label: Text("Company Name\nClick to See Profile"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.black,
                  shadowColor: Colors.transparent,
                  alignment: Alignment(-1,0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}