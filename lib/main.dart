import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:skyspy/top_pages.dart';
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
      create: (context) => AppSettings(), child: const MyApp()));
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
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget filteredStack = Consumer<AppSettings>(
      builder: (context, settings, child) => ColorFiltered(
          colorFilter: settings.redMode ? redFilter : noFilter, child: child),
      child: Stack(children: <Widget>[
        const TopPages(),
        const Align(
          alignment: Alignment(0.0, 0.80),
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
                  icon: const Icon(Icons.settings_outlined,
                      color: Colors.white,
                      size: 36.0,
                      shadows: <Shadow>[
                        Shadow(
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                            blurRadius: 5.0)
                      ]),
                  onPressed: () {
                    Provider.of<AppSettings>(context, listen: false)
                        .toggleRedMode();
                  })),
        )
      ]),
    );

    return MaterialApp(
      title: 'SkySpy',
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        fontFamily: "Karla",
      ),
      home: Scaffold(body: filteredStack),
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
