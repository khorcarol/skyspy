import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FractionallySizedBox(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Image.asset("images/Map.png", fit: BoxFit.cover)));
  }
}
