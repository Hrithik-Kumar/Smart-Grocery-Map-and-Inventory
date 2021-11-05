import 'dart:collection';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:smart_grocery_map/global.dart';
import 'package:smart_grocery_map/screens/user-home/filter_by_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ShoppingListScreen extends StatefulWidget {
  ShoppingListScreen({Key? key, this.title = 'grocery list'}) : super(key: key);

  final String title;

  @override
  _ShoppingListScreenState createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  int quantity = 1;
  int quantity1 = 1;
  int quantity2 = 3;
  Timer timer = new Timer(new Duration(seconds: 3), () {});

  Widget btn1() {
    var itemName = "Bagels | Kirkland Signature";
    int price = 100;
    var company = "Walmart";

    return Container(
      width: 350,
      height: 50,
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Color(0x33333333)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 40,
            width: 200,
            alignment: Alignment.center,
            color: Colors.white,
            child: Text(
              itemName + "\n from " + company,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.zero,
            child: Align(
              child: Text(
                '$quantity1' + '*$price=' + (quantity1 * price).toString(),
                style: TextStyle(color: Color(0xff333333), fontSize: 12),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              /*Expanded(
                flex: 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    color: Colors.grey[300],
                    child: Text(
                      itemName + "\n from " + company,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5.0,
              ),*/
              GestureDetector(
                child: Container(
                  width: 30,
                  height: 30,
                  child: Icon(Icons.remove),
                ),
                onTap: () {
                  setState(() {
                    if (quantity1 <= 0) {
                      return;
                    }
                    quantity1--;
                  });
                },
                onTapDown: (e) {
                  if (timer != null) {
                    timer.cancel();
                  }
                  if (quantity1 <= 0) {
                    return;
                  }
                  timer = Timer.periodic(Duration(milliseconds: 100), (e) {
                    setState(() {
                      if (quantity1 <= 0) {
                        return;
                      }
                      quantity1--;
                    });
                  });
                },
                onTapUp: (e) {
                  if (timer != null) {
                    timer.cancel();
                  }
                },
                onTapCancel: () {
                  if (timer != null) {
                    timer.cancel();
                  }
                },
              ),
              GestureDetector(
                child: Container(
                  width: 30,
                  height: 30,
                  child: Icon(Icons.add),
                ),
                onTap: () {
                  setState(() {
                    if (quantity1 >= 999) {
                      return;
                    }
                    quantity1++;
                  });
                },
                onTapDown: (e) {
                  if (timer != null) {
                    timer.cancel();
                  }
                  if (quantity1 >= 999) {
                    return;
                  }
                  timer = Timer.periodic(Duration(milliseconds: 100), (e) {
                    setState(() {
                      if (quantity1 >= 999) {
                        return;
                      }
                      quantity1++;
                    });
                  });
                },
                onTapUp: (e) {
                  if (timer != null) {
                    timer.cancel();
                  }
                },
                onTapCancel: () {
                  if (timer != null) {
                    timer.cancel();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget btn2() {
    var itemName = " 2L Soda | Sprite";
    int price = 2;
    var company = "Costco";

    return Container(
      width: 350,
      height: 50,
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Color(0x33333333)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 40,
            width: 200,
            alignment: Alignment.center,
            color: Colors.white,
            child: Text(
              itemName + "\n from " + company,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.zero,
            child: Align(
              child: Text(
                '$quantity2' + '*$price=' + (quantity2 * price).toString(),
                style: TextStyle(color: Color(0xff333333), fontSize: 12),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              new GestureDetector(
                child: Container(
                  width: 30,
                  height: 30,
                  child: Icon(Icons.remove),
                ),
                onTap: () {
                  setState(() {
                    if (quantity2 <= 0) {
                      return;
                    }
                    quantity2--;
                  });
                },
                onTapDown: (e) {
                  if (timer != null) {
                    timer.cancel();
                  }
                  if (quantity2 <= 0) {
                    return;
                  }
                  timer = new Timer.periodic(Duration(milliseconds: 100), (e) {
                    setState(() {
                      if (quantity2 <= 0) {
                        return;
                      }
                      quantity2--;
                    });
                  });
                },
                onTapUp: (e) {
                  if (timer != null) {
                    timer.cancel();
                  }
                },
                onTapCancel: () {
                  if (timer != null) {
                    timer.cancel();
                  }
                },
              ),
              new GestureDetector(
                child: Container(
                  width: 30,
                  height: 30,
                  child: Icon(Icons.add),
                ),
                onTap: () {
                  setState(() {
                    if (quantity2 >= 999) {
                      return;
                    }
                    quantity2++;
                  });
                },
                onTapDown: (e) {
                  if (timer != null) {
                    timer.cancel();
                  }
                  if (quantity2 >= 999) {
                    return;
                  }
                  timer = new Timer.periodic(Duration(milliseconds: 100), (e) {
                    setState(() {
                      if (quantity2 >= 999) {
                        return;
                      }
                      quantity++;
                    });
                  });
                },
                onTapUp: (e) {
                  if (timer != null) {
                    timer.cancel();
                  }
                },
                onTapCancel: () {
                  if (timer != null) {
                    timer.cancel();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget createTitle(var input) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 0.0,
          ),
          child: Text(
            input,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  String groceryListResponse = "";

  void _doQuery() async {
    try {
      // Url: http://localhost:8000/api/user/login
      // For emulator: http://10.0.2.2:8000/api/user/login
      var uri = Uri.parse('http://10.0.2.2:8000/api/customer/getItemLocations');
      var request = http.MultipartRequest('POST', uri)
        ..fields['customer_username'] = Globals.customerUsername;
      http.Response response =
          await http.Response.fromStream(await request.send());
      if (response.statusCode == 200) {
        // Success
        //_showSnackbar('Success');
        groceryListResponse = response.body;
      } else if (response.statusCode == 400) {
        _showSnackbar('no customer username');
      } else {
        _showSnackbar('Unknown error');
      }
    } catch (e) {
      _showSnackbar(e.toString());
    }
  }

  void makeGroceryList() {
    _doQuery();
    if (groceryListResponse.isEmpty) {
      print("empty response");
    } else {
      final parsedList = jsonDecode(groceryListResponse);
      List<dynamic> itemsList = parsedList["customer_items"] as List<dynamic>;
      print(itemsList.runtimeType);
      Globals.customerItems = itemsList;
      setState(() {});
    }
    // return Text("hello");
  }

  List<Widget> makeButtons(List itemsList) {
    List<Widget> ret = [];
    if (itemsList.isEmpty) {
      return [];
    } else {
      for (Map map in itemsList) {
        ret.add(makeButton(map));
      }
      return ret;
    }
  }

  Widget makeButton(Map m) {
    dynamic company = m["company_name"];
    dynamic itemName = m["product_name"];
    dynamic aisle = m["aisle"];
    dynamic shelf = m["shelf"];

    return Container(
      width: 350,
      height: 50,
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Color(0x33333333)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 40,
            width: 200,
            alignment: Alignment.center,
            color: Colors.white,
            child: Text(
              itemName +
                  "\nfrom " +
                  company +
                  "\nAisle " +
                  aisle +
                  "Shelf" +
                  shelf,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.zero,
          //   child: Align(
          //     child: Text(
          //       '$quantity2' + '*$price=' + (quantity2 * price).toString(),
          //       style: TextStyle(color: Color(0xff333333), fontSize: 12),
          //     ),
          //   ),
          // ),
          // Row(
          //   children: <Widget>[
          //     GestureDetector(
          //       child: Container(
          //         width: 30,
          //         height: 30,
          //         child: const Icon(Icons.remove),
          //       ),
          //       onTap: () {
          //         setState(() {
          //           if (quantity2 <= 0) {
          //             return;
          //           }
          //           quantity2--;
          //         });
          //       },
          //       onTapDown: (e) {
          //         if (timer != null) {
          //           timer.cancel();
          //         }
          //         if (quantity2 <= 0) {
          //           return;
          //         }
          //         timer =
          //             Timer.periodic(const Duration(milliseconds: 100), (e) {
          //           setState(() {
          //             if (quantity2 <= 0) {
          //               return;
          //             }
          //             quantity2--;
          //           });
          //         });
          //       },
          //       onTapUp: (e) {
          //         if (timer != null) {
          //           timer.cancel();
          //         }
          //       },
          //       onTapCancel: () {
          //         if (timer != null) {
          //           timer.cancel();
          //         }
          //       },
          //     ),
          //     GestureDetector(
          //       child: Container(
          //         width: 30,
          //         height: 30,
          //         child: Icon(Icons.add),
          //       ),
          //       onTap: () {
          //         setState(() {
          //           if (quantity2 >= 999) {
          //             return;
          //           }
          //           quantity2++;
          //         });
          //       },
          //       onTapDown: (e) {
          //         if (timer != null) {
          //           timer.cancel();
          //         }
          //         if (quantity2 >= 999) {
          //           return;
          //         }
          //         timer =
          //             Timer.periodic(const Duration(milliseconds: 100), (e) {
          //           setState(() {
          //             if (quantity2 >= 999) {
          //               return;
          //             }
          //             quantity++;
          //           });
          //         });
          //       },
          //       onTapUp: (e) {
          //         if (timer != null) {
          //           timer.cancel();
          //         }
          //       },
          //       onTapCancel: () {
          //         if (timer != null) {
          //           timer.cancel();
          //         }
          //       },
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          icon: new Icon(Icons.search, color: Colors.grey),
          onPressed: () {},
        ),



      ),*/

      appBar: AppBar(
          title: Padding(
        padding: EdgeInsets.only(top: 2, bottom: 2, left: 16),
        child: Container(
          height: 35,
          width: MediaQuery.of(context).size.width - 64,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: InkWell(
            child: Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Icon(Icons.search, color: Colors.black)),
                Text(
                  "search",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                )
              ],
            ),
            onTap: () {
              showSearch(context: context, delegate: filter_by_item());
            },
          ),
        ),
      )),
      body: Center(
        child: Column(children: <Widget>[
          createTitle('Current grocery list:'),
          ElevatedButton(
              onPressed: makeGroceryList, child: const Text("Refresh")),
          btn1(),
          btn2(),
          Column(children: makeButtons(Globals.customerItems))
        ]),
      ),

      /*Stack(children: <Widget>[
        Container(
          color: Colors.white,
        ),
        SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(height: 20.0),
            Text(
              'Current grocery list:',
              style: TextStyle(color: Colors.black54, fontSize: 18.0),
            ),
            SizedBox(height: 10.0,),
            btn(quantity1, " Bagels | Kirkland Signature", 100, "Walmart"),
            SizedBox(height: 10.0,),
            btn(quantity2, " 2L Soda | Sprite", 2, "Costco"),
          ]),
        ),
      ]),*/
    );
  }
}

/*   Widget CreateCustomInventory(int quantity, var itemName, int price, var company) {
      return Row(
      ),
    }*/

/* children: <Widget>[
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 40,
                alignment: Alignment.center,
                color: Colors.grey[300],
                child: Text(
                  '$quantity'+"*",
                ),
              ),
            ),
          ),

          SizedBox(
            width: 5.0,
          ),

          Expanded(
            flex: 9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 40,
                alignment: Alignment.center,
                color: Colors.grey[300],
                child: Text(
                  itemName + "\n from " + company,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

          SizedBox(
            width: 5.0,
          ),

          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 40,
                alignment: Alignment.center,
                color: Colors.grey[300],
                child: Text(
                  (price*quantity).toString()+'\$',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),


                ),
              ),
            ),
          ),

          SizedBox(
            width: 5.0,
          ),*/

/*Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 40,
                color: Colors.grey[300],
                child: Row(children: [
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        quantity = quantity+1;
                      },
                      child: Text('+'),
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        quantity = quantity - 1;
                      },
                      child: Text('-'),
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),*/
