import 'package:flutter/material.dart';

class WidgetPage extends StatefulWidget {
  const WidgetPage({super.key});

  @override
  State<WidgetPage> createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  @override
  Widget build(BuildContext context) {
    return const Stack(children: [
      FractionallySizedBox(
      widthFactor: 1.0,
      heightFactor: 1.0,
      child: Image(image: AssetImage('images/widget_background.png'), fit: BoxFit.cover),
    )]);
  }
}

