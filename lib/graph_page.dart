import 'package:skyspy/light_chart.dart';
import 'package:skyspy/stargazing_chart.dart';
import 'package:skyspy/wind_chart.dart';
import 'package:skyspy/moonlight_chart.dart';
import 'package:flutter/material.dart';
import 'package:skyspy/weather_icons_icons.dart';
import 'package:skyspy/background.dart';
import 'package:skyspy/hours_bar.dart';
import 'package:skyspy/default_text_style.dart';

class GraphPage extends StatelessWidget {
  const GraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    // materialApp with debugbanner false
    return MaterialApp(
      // theme of the app
      // theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      // scaffold with app
      home: Scaffold(
        body: Stack(children: <Widget>[
          const Background(),
          const HoursBar(),
          Padding(
            padding: EdgeInsets.only(left: 0.05 * width),
            child: Container(
              alignment: const Alignment(0, -0.9),
              child: const Row(
                children: <Widget>[
                  DefaultTextStyleExample(
                      fontsize: 40, boldBool: true, input: "tonight")
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0.05 * width),
            child: Container(
              alignment: const Alignment(0, -0.5),
              child: const Row(
                children: <Widget>[
                  Icon(
                    Icons.auto_awesome_outlined,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 10),
                  DefaultTextStyleExample(input: "stargazing index")
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 0.05 * width, right: 0.05 * width),
              child: Align(
                alignment: const Alignment(0, -0.32),
                child: StargazingChart(),
              )),
          Padding(
            padding: EdgeInsets.all(0.05 * width),
            child: Container(
              alignment: const Alignment(0, -0.1),
              child: const Row(
                children: <Widget>[
                  Icon(
                    WeatherIcons.moon_1,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 10),
                  DefaultTextStyleExample(input: "moonlight")
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 0.05 * width, right: 0.05 * width),
              child: Align(
                alignment: const Alignment(0, 0.1),
                child: MoonlightChart(),
              )),
          Padding(
            padding: EdgeInsets.all(0.05 * width),
            child: Container(
              alignment: const Alignment(0, 0.3),
              child: const Row(
                children: <Widget>[
                  Icon(
                    WeatherIcons.wind,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 10),
                  DefaultTextStyleExample(input: "wind speed (m/s)")
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 0.05 * width, right: 0.05 * width),
              child: Align(
                alignment: const Alignment(0, 0.52),
                child: WindChart(),
              )),
          Padding(
            padding: EdgeInsets.all(0.05 * width),
            child: Container(
              alignment: const Alignment(0, 0.7),
              child: const Row(
                children: <Widget>[
                  Icon(
                    WeatherIcons.lamp,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 10),
                  DefaultTextStyleExample(input: "light pollution (%)")
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 0.05 * width, right: 0.05 * width),
              child: Align(
                alignment: const Alignment(0, 0.95),
                child: LightChart(),
              )),
        ]),
      ),
    );
  }
}
