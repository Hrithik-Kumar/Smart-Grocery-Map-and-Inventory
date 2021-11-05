import 'package:flutter/material.dart';
import 'package:smart_grocery_map/screens/user-home/components/cashier.dart';
import 'package:smart_grocery_map/screens/user-home/components/entry_exit.dart';
import 'package:smart_grocery_map/screens/user-home/components/fruits_and_veg.dart';
import 'package:smart_grocery_map/screens/user-home/components/vertical_bar.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

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
                      child: VeritcalBar(),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const Expanded(
                      child: VeritcalBar(),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const Expanded(
                      child: VeritcalBar(),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const Expanded(
                      child: VeritcalBar(),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const Expanded(
                      child: VeritcalBar(),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const Expanded(
                      child: VeritcalBar(),
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
                      child: VeritcalBar(),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    const Expanded(
                      child: VeritcalBar(),
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
