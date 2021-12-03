import 'package:flutter/material.dart';
import 'package:smart_grocery_map/res/title_bar.dart';
import '/res/colors.dart';
import 'package:http/http.dart' as http;

// Define a custom Form widget.
class CompanySignUpScreen extends StatefulWidget {
  const CompanySignUpScreen({Key? key}) : super(key: key);

  @override
  CompanySignUpScreenState createState() {
    return CompanySignUpScreenState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class CompanySignUpScreenState extends State<CompanySignUpScreen> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  static const TextStyle titleTextStyle = TextStyle(
    color: yellow,
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle formFieldTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 18.0,
  );
  static TextStyle formFieldHintTextStyle = TextStyle(
    color: Colors.grey[400],
    fontSize: 12.0,
  );
  static const TextStyle formFieldLabelTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 18.0,
  );

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController managerController = TextEditingController();
  TextEditingController storeNameController = TextEditingController();
  TextEditingController storeLocController = TextEditingController();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    managerController.dispose();
    storeNameController.dispose();
    storeLocController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.white,
            ],
          ),
        ),
        height: queryData.size.height,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: queryData.size.width * 0.05,
                vertical: queryData.size.height * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  makeTitleAndBackButton(
                      "Smart Grocery - Company Signup", context),

                  // Wrap IconButton and TitleBar in a thing
                  // Add TextFormFields and ElevatedButton here.
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.person, color: Colors.black),
                      hintStyle: formFieldHintTextStyle,
                      labelStyle: formFieldLabelTextStyle,
                      hintText: 'Enter your preferred username',
                      labelText: 'Username *',
                    ),
                    style: formFieldTextStyle,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),

                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: _obscureText,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.password, color: Colors.black),
                      hintStyle: formFieldHintTextStyle,
                      labelStyle: formFieldLabelTextStyle,
                      hintText: 'Enter your password',
                      labelText: 'Password *',
                      suffixIcon: IconButton(
                          icon: checkObscure(_obscureText), onPressed: _toggle, color: Colors.black,),
                    ),
                    style: formFieldTextStyle,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 8) {
                        return 'Please enter at least 8 characters to create '
                            'a strong password';
                      }
                      return null;
                    },
                  ),

                  TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.email, color: Colors.black),
                        hintStyle: formFieldHintTextStyle,
                        labelStyle: formFieldLabelTextStyle,
                        hintText: 'Enter your email address',
                        labelText: 'Email *',
                      ),
                      style: formFieldTextStyle,
                      // The validator receives the text that the user has entered.
                      validator: validateEmail),

                  TextFormField(
                    controller: managerController,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.face, color: Colors.black),
                      hintStyle: formFieldHintTextStyle,
                      labelStyle: formFieldLabelTextStyle,
                      hintText: 'Enter the Manager Name',
                      labelText: 'Manager Name *',
                    ),
                    style: formFieldTextStyle,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),

                  TextFormField(
                    controller: storeNameController,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.storefront, color: Colors.black),
                      hintStyle: formFieldHintTextStyle,
                      labelStyle: formFieldLabelTextStyle,
                      hintText: 'Enter the Store Name',
                      labelText: 'Store Name *',
                    ),
                    style: formFieldTextStyle,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),

                  TextFormField(
                    controller: storeLocController,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.location_on, color: Colors.black),
                      hintStyle: formFieldHintTextStyle,
                      labelStyle: formFieldLabelTextStyle,
                      hintText: 'Enter the Store Location',
                      labelText: 'Store Location *',
                    ),
                    style: formFieldTextStyle,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () async {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );

                        String user = usernameController.text;
                        String pass = passwordController.text;
                        String email = emailController.text;
                        String manager = managerController.text;
                        String sName = storeNameController.text;
                        String sLoc = storeLocController.text;

                        // DELETE LATER
                        // print("Username: " + user);
                        // print("Password: " + pass);
                        // print("Email: " + email);
                        // print("Manager: " + manager);
                        // print("Store Name: " + sName);
                        // print("Store Location: " + sLoc);

                        var uri = Uri.parse(
                            'http://10.0.2.2:8000/api/company/signup');
                        var request = http.MultipartRequest('POST', uri)
                          ..fields['username'] = user
                          ..fields['password'] = pass
                          ..fields['email'] = email
                          ..fields['manager_name'] = manager
                          ..fields['store_name'] = sName
                          ..fields['store_location'] = sLoc;
                        http.Response response = await http.Response.fromStream(
                            await request.send());

                        if (response.statusCode == 201) {
                          Navigator.pop(context, "Successful Registration");
                        } else if (response.body
                            .contains("username already exists")) {
                          const SnackBar usernameSnackBar = SnackBar(
                              content: Text(
                                  'Username already exists! Please choose another one.'));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(usernameSnackBar);
                        } else if (response.body.contains("status")) {
                          SnackBar errorSnackBar = SnackBar(
                              content: Text(parseResponse(response.body)));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(errorSnackBar);
                        } else {
                          const SnackBar unknownSnackBar =
                              SnackBar(content: Text('Unknown Error'));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(unknownSnackBar);
                        }
                      }
                    },

                    child: const Text('Register'),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(yellow)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String? validateEmail(String? value) {
  String? pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'Enter a valid email address';
  } else {
    return null;
  }
}

String parseResponse(String value) {
  String? pattern = r"'status' : '(\w+)'+";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return "";
  } else if (!regex.hasMatch(value)) {
    return regex.stringMatch(value).toString();
  } else {
    return "";
  }
}

Icon checkObscure(bool obscure) {
  if (obscure) {
    return const Icon(Icons.visibility_off, color: yellow);
  } else {
    return const Icon(Icons.visibility, color: yellow);
  }
}




// // Testing -- Remove later


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Smart Grocery Map - Company Sign Up Screen',
//       home: NavBar(),
//     );
//   }
// }

// class NavBar extends StatefulWidget {
//   const NavBar({Key? key}) : super(key: key);

//   @override
//   NavBarState createState() => NavBarState();
// }

// class NavBarState extends State<NavBar> {
//   @override
//   Widget build(BuildContext context) {
    
//     return const Scaffold(
//       body: CompanySignUpScreen(),
//     );
//   }
// }
