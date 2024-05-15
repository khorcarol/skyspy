import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(50, 42, 104, 1),
              Color.fromRGBO(123, 85, 150, 1),
              Color.fromRGBO(180, 126, 136, 1),
              Color.fromRGBO(180, 126, 136, 1),
            ]
          )),
        child: const Stack(children: [
          FractionallySizedBox(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Image(image: AssetImage('images/combined.png'), fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.only(top: 140.0),
            child: Center(
              child: Column(children: [
                Text(
                  'stargazing suitability',
                  style: TextStyle(
                    color: Colors.white, // Set text color as needed
                    fontSize: 20, // Set font size as needed
                  ),
                ),
                Text(
                  '86%',
                  style: TextStyle(
                    color: Colors.white, // Set text color as needed
                    fontSize: 70, // Set font size as needed
                  ),
                ),
              ])
            )
          ),
        ]),
      ),
    );
  }
}
