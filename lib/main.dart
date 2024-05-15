import 'dart:ui';
import 'package:flutter/material.dart';
// I think we can just use default Material icons tbh
// import 'package:flutter_font_icons/flutter_font_icons.dart';

import 'package:skyspy/top_pages.dart';
import 'package:skyspy/glowing_icon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkySpy',
      scrollBehavior:  MyCustomScrollBehavior(), // allows drag to scroll on desktop/web
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: "Karla"),
      home: const Stack(
        children: <Widget>[
          TopPages(),
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
          ),
          Align(
            alignment: Alignment(-0.8, -0.8),
            child: GlowingIcon(icon: Icons.settings_outlined)
          )
        ]
      )
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => { 
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
