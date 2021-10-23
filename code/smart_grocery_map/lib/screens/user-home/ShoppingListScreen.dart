import 'package:flutter/material.dart';
import 'dart:async';

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
                '$quantity1' + '*$price='+ (quantity1*price).toString(),
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
              new GestureDetector(
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
                  timer = new Timer.periodic(Duration(milliseconds: 100), (e) {
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
              new GestureDetector(
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
                  timer = new Timer.periodic(Duration(milliseconds: 100), (e) {
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
                '$quantity2' + '*$price='+ (quantity2*price).toString(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          icon: new Icon(Icons.search, color: Colors.grey),
          onPressed: () {},
        ),
      ),
      body: Center(
        child: Column(children: <Widget>[
          createTitle('Current grocery list:'),
          btn1(),
          btn2(),
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
