import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skyspy/main.dart';

class HomeDayPage extends StatelessWidget {
  const HomeDayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromRGBO(8, 75, 131, 1),
              Color.fromRGBO(66, 184, 221, 1),
              Color.fromRGBO(201, 230, 187, 1),
              Color.fromRGBO(253, 239, 218, 1),
              Color.fromRGBO(253, 239, 218, 1),
            ])),
        child: Stack(children: [
          const FractionallySizedBox(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Image(
                image: AssetImage('images/home_day.png'), fit: BoxFit.cover),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 140.0),
              child: Center(
                  child: Column(children: [
                const Text(
                  'stargazing suitability',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                    Provider.of<WeatherData>(context)
                            .data
                            ?.tempMax
                            ?.celsius
                            ?.toInt()
                            .toString() ??
                        "...",
                    style: const TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 0.6),
                      fontSize: 70,
                    ))
              ]))),
        ]),
      ),
    );
  }
}
