import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InteractiveViewer(
        
      minScale: 1.0,
      maxScale: 2,
      child: FractionallySizedBox(
          
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: Image.asset("images/map.png", fit: BoxFit.cover)),
    ));
  }
}
