import 'package:flutter/material.dart';
import '/res/colors.dart';

class WelcomeButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;
  const WelcomeButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   width: MediaQuery.of(context).size.width * 0.7,
    //   height: 48.0,
    //   child: ElevatedButton(
    //     onPressed: onPressed,
    //     style: ElevatedButton.styleFrom(
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(20.0),
    //       ),
    //     ),
    //     child: Text(text),
    //   ),
    // );
    return RawMaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side:BorderSide(color: yellow, width: 4),),
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(height: 55),
      fillColor: color,
      elevation: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: yellow,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
