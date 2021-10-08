import 'package:flutter/material.dart';
import './CompanyLogout.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Orders = FlatButton(
      child: Text('Your Previous Orders', style: TextStyle(color: Colors.black54, fontSize: 18.0),),
      onPressed: () {},
    );

    final Payments = FlatButton(
      child: Text('Your payments', style: TextStyle(color: Colors.black54, fontSize: 18.0),),
      onPressed: () {},
    );

    final Subscriptions = FlatButton(
      child: Text('Your subscriptions', style: TextStyle(color: Colors.black54, fontSize: 18.0),),
      onPressed: () {},
    );

    final Support = FlatButton(
      child: Text('Other Support?', style: TextStyle(color: Colors.black54, fontSize: 18.0),),
      onPressed: () {},
    );

    final LogOutButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new CompanyLogout()));
          },
          color: Colors.green,
          child: Text('Log Out', style: TextStyle(color: Colors.white, fontSize: 20.0),),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            Orders,
            SizedBox(height: 8.0,),
            Payments,
            SizedBox(height: 8.0,),
            Subscriptions,
            SizedBox(height: 8.0,),
            Support,
            SizedBox(height: 150.0,),
            LogOutButton
          ],
        ),
      ),
    );

  }
}


/* import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex:1,
                child: FlatButton.icon(
                  onPressed: () {
                    
                  },
                  icon: Icon(Icons.local_convenience_store_rounded),
                  label: Text(""),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'Company Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
            ]
          )
          //child
        )
      )
    );
  }
} */