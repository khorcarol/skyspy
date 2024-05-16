import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultTextStyleExample extends StatelessWidget {
  // const DefaultTextStyleExample({super.key});
  final String input;
  final double fontsize;
  final bool boldBool;


  DefaultTextStyleExample({this.fontsize = 16, this.boldBool = false, required this.input});

  @override
  Widget build(BuildContext context) {

    return DefaultTextStyle(
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: (boldBool) ? FontWeight.bold : FontWeight.normal
      ),
      child: Text(input)
    );
  }
}