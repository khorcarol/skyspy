import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skyspy/main.dart';

import 'package:skyspy/glowing_icon.dart';
import 'package:skyspy/home.dart';
import 'package:skyspy/maps.dart';
import 'package:skyspy/widgets.dart';
import 'package:skyspy/widgets2.dart';

class TopPages extends StatefulWidget {
  const TopPages({super.key});

  @override
  State<StatefulWidget> createState() => _TopPagesState();
}

class _TopPagesState extends State<TopPages> with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController(initialPage: 1);
    _tabController = TabController(initialIndex: 1, length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: <Widget>[
      PageView(
          controller: _pageViewController,
          onPageChanged: _handlePageViewChanged,
          children: <Widget>[
            const WidgetPage(),
            const HomePage(),
            const MapPage()
          ]),
      Align(
        alignment: const Alignment(0.0, 0.9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const GlowingIcon(icon: Icons.cloud_outlined),
                Text(
                  Provider.of<WeatherData>(context).data?.cloudiness?.toInt().toString() ?? "...",
                )
              ]
            ),
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GlowingIcon(icon: Icons.nightlight_outlined),
                Text(
                  "25"
                )
              ]
            ),
            const GlowingIcon(icon: Icons.keyboard_arrow_up_outlined),
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GlowingIcon(icon: Icons.lightbulb_outlined),
                Text(
                  "67"
                )
              ]
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const GlowingIcon(icon: Icons.thermostat_outlined),
                Text(
                  Provider.of<WeatherData>(context).data?.temperature?.celsius?.toInt().toString() ?? "...",
                )
              ]
            ),
        ]),
      ),
      PageIndicator(
        tabController: _tabController,
        currentPageIndex: _currentPageIndex,
      ),
    ]);
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator(
      {super.key, required this.tabController, required this.currentPageIndex});

  final int currentPageIndex;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TabPageSelector(
            controller: tabController,
            selectedColor: colorScheme.primary,
          )
        ],
      ),
    );
  }
}
