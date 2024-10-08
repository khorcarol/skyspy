import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:skyspy/app_state.dart';
import 'package:skyspy/vertical_pages.dart';
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
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppSettings()),
        ChangeNotifierProvider(create: (context) => WeatherData()),
      ],
      child: MaterialApp(
          title: 'SkySpy',
          scrollBehavior: MyCustomScrollBehavior(), // allows drag to scroll on desktop/web
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.deepPurple, brightness: Brightness.dark),
              useMaterial3: true,
              fontFamily: "Karla"),
          home: const MyApp())));
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget filteredStack = Consumer<AppSettings>(
      builder: (context, settings, child) => ColorFiltered(
          colorFilter: settings.redMode ? redFilter : noFilter, child: child),
      child: Stack(children: <Widget>[
        const VerticalPages(),
        Positioned(
          top: 50.0,
          right: 20.0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const GlowingIcon(icon: Icons.refresh_outlined),
                iconSize: 36.0,
                onPressed: Provider.of<WeatherData>(context, listen: false).queryWeather
              ),
              IconButton(
                icon: const GlowingIcon(icon: Icons.settings_outlined),
                iconSize: 36.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()),
                  );
                }
              ),
            ],
          )
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
