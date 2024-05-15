import 'package:flutter/material.dart';
import 'package:skyspy/home.dart';
import 'package:skyspy/maps.dart';

class TopPages extends StatefulWidget {
  const TopPages({super.key});

  @override
  State<StatefulWidget> createState()  => _TopPagesState();
}

class _TopPagesState extends State<TopPages> with TickerProviderStateMixin{
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment:  Alignment.bottomCenter,
      children: <Widget>[
        PageView(
          controller: _pageViewController,
          onPageChanged: _handlePageViewChanged,
          children: <Widget>[
            const HomePage(),
            const MapPage()
          ]
        ),
        PageIndicator(
          tabController: _tabController,
          currentPageIndex: _currentPageIndex,
        ),
      ]
    );
  }

  
  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }
}


class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex
  });

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
