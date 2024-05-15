import 'package:flutter/material.dart';

import 'package:skyspy/home.dart';
import 'package:skyspy/maps.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo2',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: "Karla"),
      home: const MapPage(), // CHANGE THIS LINE TO QUICKLY TEST DIFFERENT PAGES
    );
  }
}

