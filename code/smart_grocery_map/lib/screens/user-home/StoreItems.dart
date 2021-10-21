import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StoreItems extends StatelessWidget {

  Widget createRowItem(var quantity, var itemName) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 30,
              alignment: Alignment.center,
              color: Colors.grey[300],
              child: Text(quantity,),
            ),
          ),
        ),
        SizedBox(width: 5.0,),
        Expanded(
          flex: 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 30,
              alignment: Alignment.center,
              color: Colors.grey[300],
              child: Text(
                itemName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 5.0,),
        Expanded(
          flex: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 30,
              color: Colors.grey[300],
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
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
                      },
                      child: Text('-'),
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                ]
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 28.0,
          vertical: 100.0,
        ),
        child: Column(
          children: [
            Text(
              "What We Sell",
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0,),
            createRowItem("0x", " Bagels | Kirkland Signature"),
            SizedBox(height: 10.0,),
            createRowItem("0x", " 2L Soda | Sprite"),
          ],
        ),
      ),
    );
  }
}