import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

import 'package:skyspy/home.dart';
import 'package:skyspy/maps.dart';

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
                Icon(AntDesign.stepforward, color: Colors.white,),
                Icon(Entypo.aircraft, color: Colors.white,),
                Icon(EvilIcons.chevron_down, color: Colors.white,),
                Icon(Feather.activity, color: Colors.white,),
                Icon(FontAwesome.glass, color: Colors.white,),
              ]),
          )
        ]
      )
    );
  }
}

