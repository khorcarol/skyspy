import 'package:flutter/material.dart';
import 'package:zoom_widget/zoom_widget.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InteractiveViewer(
      
      boundaryMargin: EdgeInsets.all(100),
      minScale: 1,
      maxScale: 2,
      child: FractionallySizedBox(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: Image.asset("images/map.png", fit: BoxFit.cover)),
    ));
  }
}
