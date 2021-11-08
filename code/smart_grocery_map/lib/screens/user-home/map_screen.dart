import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_grocery_map/global.dart';
import 'package:smart_grocery_map/screens/user-home/components/cashier.dart';
import 'package:smart_grocery_map/screens/user-home/components/entry_exit.dart';
import 'package:smart_grocery_map/screens/user-home/components/vertical_bar.dart';
import 'package:http/http.dart' as http;

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
    _getShoppingList();
  }

  void _getShoppingList() async {
    try {
      // Url: http://10.0.2.2:8000/api/customer/getItemLocations
      Uri uri = Uri.parse('http://10.0.2.2:8000/api/customer/getItemLocations');
      var request = http.MultipartRequest('POST', uri)
        ..fields['customer_username'] = Globals.customerUsername;
      http.Response response =
          await http.Response.fromStream(await request.send());
      if (response.statusCode == 200) {
        print('Success');
        print(response.body);
      } else {
        Map dataMap = jsonDecode(response.body);
        _showSnackbar(dataMap['status']);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    const Expanded(
                      child: VerticalBar(),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const Expanded(
                      child: VerticalBar(),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const Expanded(
                      child: VerticalBar(),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const Expanded(
                      child: VerticalBar(),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const Expanded(
                      child: VerticalBar(),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const Expanded(
                      child: VerticalBar(),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
                // Center(
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 30.0),
                //     child: SizedBox(
                //       height: 250.0,
                //       child: ListView.builder(
                //         shrinkWrap: true,
                //         scrollDirection: Axis.horizontal,
                //         physics: const NeverScrollableScrollPhysics(),
                //         itemCount: 6,
                //         itemBuilder: (context, index) {
                //           return const Padding(
                //             padding: EdgeInsets.only(right: 30.0),
                //             child: VerticalBar(),
                //           );
                //         },
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    const Expanded(
                      child: VerticalBar(),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const Expanded(
                      child: VerticalBar(),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      child: Container(),
                    ),

                    const Expanded(
                      flex: 4,
                      child: Cashier(),
                    ),
                    // Column(
                    //   children: const [
                    //     FruitsAndVeg(text: 'Veg', color: Colors.lightGreen),
                    //     FruitsAndVeg(text: 'Fruits', color: Colors.pink),
                    //   ],
                    // ),
                    // const Cashier(),
                  ],
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    EntryExit(
                      text: Text(
                        'Entry',
                        style: TextStyle(color: Colors.black, fontSize: 30.0),
                      ),
                      barColor: Colors.green,
                    ),
                    EntryExit(
                      text: Text(
                        'Exit',
                        style: TextStyle(color: Colors.black, fontSize: 30.0),
                      ),
                      barColor: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
