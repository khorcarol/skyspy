import 'package:flutter/material.dart';

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
                  Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Container(height: 200, color: Colors.white)),
                  Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Container(height: 200, color: Colors.white)),
                      Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Container(height: 200, color: Colors.white)),
                      Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Container(height: 200, color: Colors.white)),
                ],
              ),
            ));
  }
}
