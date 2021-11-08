import 'package:flutter/material.dart';

class VerticalBar extends StatelessWidget {
  final Color color;
  const VerticalBar({
    Key? key,
    this.color = Colors.brown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50.0,
          color: color,
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 4.0,
            backgroundColor: color,
          ),
        ),
        Container(
          height: 50.0,
          color: color,
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 4.0,
            backgroundColor: color,
          ),
        ),
        Container(
          height: 50.0,
          color: color,
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 4.0,
            backgroundColor: color,
          ),
        ),
        Container(
          height: 50.0,
          color: color,
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 4.0,
            backgroundColor: color,
          ),
        ),
      ],
    );
  }
}
