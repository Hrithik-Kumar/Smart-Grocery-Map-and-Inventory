import 'package:flutter/material.dart';
import 'package:smart_grocery_map/res/colors.dart';

import '../company_delete_item.dart';

class InventoryItem extends StatelessWidget {
  const InventoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: NetworkImage(''),
          fit: BoxFit.cover,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // boxShadow: const [
        //   BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 3)
        // ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: navblue.withOpacity(0.9),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Apple',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 2.0),
                  const Text(
                    '4',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 2.0),
                  GestureDetector(
                    child: Container(
                      width: 300,
                      height: 20,
                      child: const Icon(Icons.delete_outline),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompanyDeleteItem()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
