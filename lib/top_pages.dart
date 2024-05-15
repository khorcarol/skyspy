import 'package:flutter/material.dart';
import 'package:skyspy/home.dart';
import 'package:skyspy/maps.dart';

class TopPages extends StatefulWidget {
  const TopPages({super.key});

  @override
  State<StatefulWidget> createState()  => _TopPagesState();
}

class _TopPagesState extends State<TopPages> {
  late PageController _pageViewController;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageViewController,
      children: <Widget>[
        const HomePage(),
        const MapPage()
      ]
    );
  }
}
