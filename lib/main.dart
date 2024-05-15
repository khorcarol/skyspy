import 'package:flutter/material.dart';
import 'package:skyspy/glowing_icon.dart';
// I think we can just use default Material icons tbh
// import 'package:flutter_font_icons/flutter_font_icons.dart';

import 'package:skyspy/home.dart';
import 'package:skyspy/maps.dart';
import 'package:skyspy/glowing_icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo2',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: "Karla"),
      home: const Stack(
        children: <Widget>[
          HomePage(), // CHANGE THIS LINE TO QUICKLY TEST DIFFERENT PAGES
          Align(
            alignment: Alignment(0.0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GlowingIcon(icon: Icons.cloud_outlined),
                GlowingIcon(icon: Icons.nightlight_outlined),
                GlowingIcon(icon: Icons.expand_more_outlined),
                GlowingIcon(icon: Icons.lightbulb_outlined),
                GlowingIcon(icon: Icons.thermostat_outlined),
              ]),
          )
        ]
      )
    );
  }
}

