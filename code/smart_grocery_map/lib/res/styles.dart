import 'package:flutter/material.dart';
import '/res/colors.dart';

const kHintTextStyle = TextStyle(
  color: Colors.white54,
);

const kLabelStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

final kBoxDecorationStyle = BoxDecoration(
    border: Border.all(color: yellow, width: 4),
  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side:BorderSide(color: yellow, width: 4),),
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 1),
    ),
  ],
);
