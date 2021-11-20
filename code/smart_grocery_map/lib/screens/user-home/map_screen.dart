import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_grocery_map/global.dart';
import 'package:smart_grocery_map/models/map_item.dart';
import 'package:smart_grocery_map/screens/user-home/components/cashier.dart';
import 'package:smart_grocery_map/screens/user-home/components/entry_exit.dart';
import 'package:smart_grocery_map/screens/user-home/components/vertical_bar.dart';
import 'package:http/http.dart' as http;
import 'package:smart_grocery_map/screens/user-home/routeplanningdistance.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<MapItem> items = [];
  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(seconds: 3), () {
    //   setState(() {
    //     items = MapItem.getDummyList();
    //   });
    // });
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
        Map dataMap = jsonDecode(response.body);
        dataMap['customer_items'].forEach((element) {
          MapItem mapItem = MapItem(
            productName: element['product_name'],
            aisle: element['aisle'],
            position: element['shelf'],
          );
          items.add(mapItem);
        });
        setState(() {});
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

  List<MapItem> _getSpecifiedAisleItems(int aisle) {
    if (items.isNotEmpty) {
      List<MapItem> list =
          items.where((element) => element.aisle == aisle).toList();
      if (list.isNotEmpty) {
        return list;
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {

    var routeplanningDistanceButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 100.0,
          height: 42.0,
          onPressed: () => /*routeplanningdistance(),*/ Navigator.push(context, new MaterialPageRoute(builder: (context) => new routeplanningdistance())),
          color: Colors.green,
          child: Text('route by distance', style: TextStyle(color: Colors.white, fontSize: 15.0),),
        ),
      ),
    );

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
                    Expanded(
                      child: VerticalBar(items: _getSpecifiedAisleItems(1)),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      child: VerticalBar(items: _getSpecifiedAisleItems(2)),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      child: VerticalBar(items: _getSpecifiedAisleItems(3)),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      child: VerticalBar(items: _getSpecifiedAisleItems(4)),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      child: VerticalBar(items: _getSpecifiedAisleItems(5)),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      child: VerticalBar(items: _getSpecifiedAisleItems(6)),
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
                    Expanded(
                      child: VerticalBar(items: _getSpecifiedAisleItems(7)),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      child: VerticalBar(items: _getSpecifiedAisleItems(8)),
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
                  children: [
                    EntryExit(
                      text: Text(
                        'Entry',
                        style: TextStyle(color: Colors.black, fontSize: 30.0),
                      ),
                      barColor: Colors.green,
                    ),
                    routeplanningDistanceButton,
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
