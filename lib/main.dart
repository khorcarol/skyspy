import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:skyspy/top_pages.dart';
import 'package:skyspy/settings.dart';
import 'package:skyspy/glowing_icon.dart';

const ColorFilter noFilter = ColorFilter.matrix(<double>[
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
]);

const ColorFilter redFilter = ColorFilter.matrix(<double>[
  0.2126,
  0.7152,
  0.0722,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
]);

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppSettings(),
      child: MaterialApp(
          title: 'SkySpy',
          scrollBehavior:
              MyCustomScrollBehavior(), // allows drag to scroll on desktop/web
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.deepPurple, brightness: Brightness.dark),
              useMaterial3: true,
              fontFamily: "Karla"),
          home: const MyApp())));
}

class AppSettings extends ChangeNotifier {
  bool _redMode = false;
  bool get redMode => _redMode;
  set redMode(bool value) {
    if (_redMode != value) {
      _redMode = value;
      notifyListeners();
    }
  }

  void toggleRedMode() {
    _redMode = !_redMode;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget filteredStack = Consumer<AppSettings>(
      builder: (context, settings, child) => ColorFiltered(
          colorFilter: settings.redMode ? redFilter : noFilter, child: child),
      child: Stack(children: <Widget>[
        const TopPages(),
        const Align(
          alignment: Alignment(0.0, 0.9),
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
        Positioned(
          top: 50.0,
          right: 20.0,
          child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: IconButton(
                  icon: const GlowingIcon(icon: Icons.settings_outlined),
                  iconSize: 36.0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()),
                    );
                  })),
        )
      ]),
    );

    return Scaffold(body: filteredStack);
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
