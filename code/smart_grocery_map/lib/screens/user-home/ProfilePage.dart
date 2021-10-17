import 'package:flutter/material.dart';
import '/screens/auxiliary/CompanyLogout.dart';
import '../../company_signup_screen.dart';
import '/res/colors.dart';
import '/res/styles.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfilePage> {
  Widget descriptionInput() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'Please input',
      decoration: InputDecoration(
          hintText: 'To revise it: ',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

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
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            Text('Username:', style: TextStyle(color: Colors.black54, fontSize: 18.0),),
            SizedBox(height: 4.0,),
            descriptionInput(),
            SizedBox(height: 8.0,),
            Text('First Name:', style: TextStyle(color: Colors.black54, fontSize: 18.0),),
            SizedBox(height: 4.0,),
            descriptionInput(),
            SizedBox(height: 8.0,),
            Text('Last Name:', style: TextStyle(color: Colors.black54, fontSize: 18.0),),
            SizedBox(height: 4.0,),
            descriptionInput(),
            SizedBox(height: 8.0,),
            Text('Email:', style: TextStyle(color: Colors.black54, fontSize: 18.0),),
            SizedBox(height: 4.0,),
            descriptionInput(),
            SizedBox(height: 40.0,),
            LogOutButton
          ],
        ),
      ),
    );

  }
}