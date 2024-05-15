import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo2',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: "Karla"),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
            ])),
        child: Stack(children: [
          const Padding(
              padding: const EdgeInsets.only(top: 140.0),
              child: const Center(
                  child: const Column(children: [
                const Text(
                  'stargazing suitability',
                  style: TextStyle(
                    color: Colors.white, // Set text color as needed
                    fontSize: 20, // Set font size as needed
                  ),
                ),
                const Text(
                  '86%',
                  style: TextStyle(
                    color: Colors.white, // Set text color as needed
                    fontSize: 70, // Set font size as needed
                  ),
                ),
              ]))),
          FractionallySizedBox(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Container(
              child: Image(
                  image: AssetImage('images/combined.png'), fit: BoxFit.cover),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(AntDesign.stepforward, color: Colors.white,),
                      Icon(Entypo.aircraft),
                      Icon(EvilIcons.chevron_down),
                      Icon(Feather.activity),
                      Icon(FontAwesome.glass),
                    ]),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
