import 'package:flutter/material.dart';
import '../auxiliary/custLogout.dart';
import '../../company_signup_screen.dart';
import '/res/colors.dart';
import '/res/styles.dart';
import 'package:http/http.dart' as http;
import '/global.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfilePage> {
  TextEditingController _oldUsername = TextEditingController();
  TextEditingController _oldPassword = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();

  void _validate() {
    if (_oldUsername.text.isEmpty ||
        _oldPassword.text.isEmpty ||
        _username.text.isEmpty ||
        _password.text.isEmpty ||
        _firstName.text.isEmpty ||
        _lastName.text.isEmpty ||
        _email.text.isEmpty) {
      _showSnackbar('Please fill in every box');
    } else {
      _doLogin();
    }
  }

  void _doLogin() async {
    try {
      var uri =
          Uri.parse('http://10.0.2.2:8000/api/customer/editprofile');
      var request = http.MultipartRequest('POST', uri)
        ..fields['username'] = _oldUsername.text
        ..fields['password'] = _oldPassword.text
        ..fields['newusername'] = _username.text
        ..fields['newpassword'] = _password.text
        ..fields['firstname'] = _firstName.text
        ..fields['lastname'] = _lastName.text
        ..fields['email'] = _email.text;
      http.Response response =
          await http.Response.fromStream(await request.send());
      if (response.statusCode == 200) {
        // Success
        _showSnackbar('Success');
        Globals.customerUsername = _username.text;
      } else if (response.statusCode == 400) {
        _showSnackbar('old username/password incorrect');
      } else {
        _showSnackbar('Failed to login');
      }
    } catch (e) {
      _showSnackbar(e.toString());
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  Widget descriptionInput(TextEditingController c) {
    return TextFormField(
      controller: c,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      //initialValue: 'Please input to revise',
      decoration: InputDecoration(
          hintText: 'Please input to revise',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
  }

  Widget createSaveButton() {
    return (TextButton(
      onPressed: _validate,
      child: Text('Save'),
      style: TextButton.styleFrom(
        primary: Colors.black,
        textStyle: const TextStyle(fontSize: 20),
      ),
    ));
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
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new CustLogout()));
          },
          color: Colors.green,
          child: Text(
            'Log Out',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            Text(
              'Old Username:',
              style: TextStyle(color: Colors.black54, fontSize: 18.0),
            ),
            SizedBox(
              height: 4.0,
            ),
            descriptionInput(_oldUsername),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Old Password:',
              style: TextStyle(color: Colors.black54, fontSize: 18.0),
            ),
            SizedBox(
              height: 4.0,
            ),
            descriptionInput(_oldPassword),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'New Username:',
              style: TextStyle(color: Colors.black54, fontSize: 18.0),
            ),
            SizedBox(
              height: 4.0,
            ),
            descriptionInput(_username),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Old Password:',
              style: TextStyle(color: Colors.black54, fontSize: 18.0),
            ),
            SizedBox(
              height: 4.0,
            ),
            descriptionInput(_password),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'First Name:',
              style: TextStyle(color: Colors.black54, fontSize: 18.0),
            ),
            SizedBox(
              height: 4.0,
            ),
            descriptionInput(_firstName),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Last Name:',
              style: TextStyle(color: Colors.black54, fontSize: 18.0),
            ),
            SizedBox(
              height: 4.0,
            ),
            descriptionInput(_lastName),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Email:',
              style: TextStyle(color: Colors.black54, fontSize: 18.0),
            ),
            SizedBox(
              height: 4.0,
            ),
            descriptionInput(_email),
            SizedBox(
              height: 4.0,
            ),
            createSaveButton(),
            LogOutButton
          ],
        ),
      ),
    );
  }
}
