import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skyspy/glowing_icon.dart';
import 'package:skyspy/app_state.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_location_picker/map_location_picker.dart';

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

class SwitchExample extends StatefulWidget {
  final bool switchValue;
  final Function(bool)? onChanged;

  const SwitchExample({super.key, required this.switchValue, this.onChanged});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  late SearchController searchController;

  @override
  void initState() {
    super.initState();
    searchController = SearchController();
  }

  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
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
                child: Text("settings", style: TextStyle(fontSize: 50))),
            CustomSwitchCard(
              title: 'red light mode',
              description: 'Less impact on vision adaptation to the dark',
              switchValue: Provider.of<AppSettings>(context).redMode,
              onChanged: (bool value) {
                Provider.of<AppSettings>(context, listen: false).redMode = value;
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

          ],
        ),
      ),
    );
  }
}
