import 'package:flutter/material.dart';

import 'package:skyspy/top_pages.dart';
import 'package:skyspy/graph_page.dart';

class VerticalPages extends StatefulWidget {
  const VerticalPages({super.key});

  @override
  State<StatefulWidget> createState() => _VerticalPagesState();
}

class _VerticalPagesState extends State<VerticalPages> with TickerProviderStateMixin {
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
      scrollDirection: Axis.vertical,
      children: <Widget>[
        const TopPages(),
        const GraphPage()
      ],
    );
  }
}
