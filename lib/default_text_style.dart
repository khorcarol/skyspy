import 'package:flutter/material.dart';

class DefaultTextStyleExample extends StatelessWidget {
  // const DefaultTextStyleExample({super.key});
  final String input;
  final double fontsize;
  final bool boldBool;


  const DefaultTextStyleExample({super.key, this.fontsize = 16, this.boldBool = false, required this.input});

  @override
  Widget build(BuildContext context) {

    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.white,
        fontSize: fontsize,
        fontWeight: (boldBool) ? FontWeight.bold : FontWeight.normal
      ),
      child: Text(input)
    );
  }
}
