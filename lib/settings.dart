import 'package:flutter/material.dart';

class CustomSwitchCard extends StatelessWidget {
  final String title;
  final String description;
  final bool switchValue;
  final Function(bool)? onChanged;

  const CustomSwitchCard({
    Key? key,
    required this.title,
    required this.description,
    required this.switchValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        height: 200,
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
        body: Container(
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
    ));
  }
}
