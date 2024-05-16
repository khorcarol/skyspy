import 'package:flutter/material.dart';

class WidgetPage extends StatefulWidget {
  const WidgetPage({super.key});

  @override
  State<WidgetPage> createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  final List<String> weatherParams = [
    'PRESSURE',
    'WIND',
    'UV INDEX',
    'VISIBILITY',
    'PRECIPITATION',
    'HUMIDITY'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 11,
          mainAxisSpacing: 13,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Opacity(
              opacity: 0.8,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${weatherParams[index]} ',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ])));
        },
      ),
    );
  }
}
