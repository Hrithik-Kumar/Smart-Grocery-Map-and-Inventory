import 'package:flutter/material.dart';
import 'package:smart_grocery_map/res/colors.dart';

Row makeTitleAndBackButton(String titleText, BuildContext context) {
  return Row(children: [
    IconButton(
      icon: const Icon(Icons.arrow_back, color: yellow),
      onPressed: () {
        Navigator.pop(context, "back");
      },
    ),
    Padding(
      padding: EdgeInsets.only(left: 50.0),
      child: Expanded(
        flex: 1,
        child: Text(
          titleText,
          style: titleTextStyle,
          textAlign: TextAlign.left,
        ),
      )
    ),
  ]);
}

const TextStyle titleTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
  );
