import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_grocery_map/res/colors.dart';
import 'package:http/http.dart' as http;

import 'components/inventory_item.dart';

class CompanyInventoryScreen extends StatefulWidget {
  const CompanyInventoryScreen({Key? key}) : super(key: key);

  @override
  _CompanyInventoryScreenState createState() => _CompanyInventoryScreenState();
}

class _CompanyInventoryScreenState extends State<CompanyInventoryScreen> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    // Url: http://localhost:8000/api/company/inventory/query
    // For emulator: http://10.0.2.2:8000/api/company/inventory/query
    String url = 'http://10.0.2.2:8000/api/company/inventory/query';
    http.Response response = await http.post(Uri.parse(url));
    if (response.statusCode == 200) {
      print('Success----------->\n ${response.body}');
    } else {
      Map dataMap = jsonDecode(response.body);
      print('Error----------->\n ${response.body}');
      _showSnackbar(dataMap['status']);
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: navblue,
        centerTitle: true,
        title: const Text('Title here'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: appAccent,
        label: const Text('Add Product'),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
        child: GridView.builder(
            itemCount: 10,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.85,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: const InventoryItem(),
              );
            }),
      ),
    );
  }
}
