import 'package:flutter/material.dart';
import 'package:skyspy/glowing_icon.dart';

class CustomSwitchCard extends StatelessWidget {
  final String title;
  final String description;
  final bool switchValue;
  final Function(bool)? onChanged;

  const CustomSwitchCard({
    super.key,
    required this.title,
    required this.description,
    required this.switchValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: Switch(
                    value: switchValue,
                    onChanged: onChanged,
                    activeColor: Colors.deepPurple,
                  )),
              Align(
                alignment: Alignment.topLeft,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontFamily: "Raleway",
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      description,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: "Raleway",
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromRGBO(78, 48, 98, 1),
                Color.fromRGBO(36, 30, 75, 1),
              ])),
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text("settings", style: TextStyle(fontSize: 50))
                ),
                CustomSwitchCard(
                  title: 'red light mode',
                  description: 'Less impact on vision adaptation to the dark',
                  switchValue: true,
                  onChanged: (bool value) {
                    // Handle switch value changes here
                  },
                ),
                CustomSwitchCard(
                  title: 'dark mode',
                  description: 'customise the app appearance',
                  switchValue: true,
                  onChanged: (bool value) {
                    // Handle switch value changes here
                  },
                ),
                CustomSwitchCard(
                  title: 'location',
                  description: 'set for accurate information',
                  switchValue: true,
                  onChanged: (bool value) {
                    // Handle switch value changes here
                  },
                ),
                CustomSwitchCard(
                  title: 'test',
                  description: 'ingr',
                  switchValue: true,
                  onChanged: (bool value) {
                    // Handle switch value changes here
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: 50.0,
            right: 20.0,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: IconButton(
                icon: const GlowingIcon(icon: Icons.arrow_back_outlined),
                iconSize: 36.0,
                onPressed: () {
                  Navigator.pop(context);
                }
              )
            ),
          )
        ]
      )
    );
  }
}
