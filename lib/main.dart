import 'dart:ui';
import 'package:flutter/material.dart';
// I think we can just use default Material icons tbh
// import 'package:flutter_font_icons/flutter_font_icons.dart';

import 'package:skyspy/top_pages.dart';
import 'package:skyspy/glowing_icon.dart';

// current values adapted from Flutter docs
// https://api.flutter.dev/flutter/dart-ui/ColorFilter/ColorFilter.matrix.html
const ColorFilter redScale = ColorFilter.matrix(<double>[
  0.2126, 0.7152, 0.0722, 0, 0,
  0,      0,      0,      0, 0,
  0,      0,      0,      0, 0,
  0,      0,      0,      1, 0,
]);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _redMode = true;

  @override
  Widget build(BuildContext context) {
    Widget mainStack = const Stack(
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
    );

    if (_redMode) {
      mainStack = ColorFiltered(
        colorFilter: redScale,
        child: mainStack,
      );
    }

    return MaterialApp(
      title: 'SkySpy',
      scrollBehavior:  MyCustomScrollBehavior(), // allows drag to scroll on desktop/web
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark
          ),
          useMaterial3: true,
          fontFamily: "Karla"),
      home: mainStack
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
