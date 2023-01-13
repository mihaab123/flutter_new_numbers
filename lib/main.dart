import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _number = "";
  var rng = Random();

  void _changeNumber() {
    setState(() {
      _number = (rng.nextDouble() * 10).toStringAsFixed(2);
    });
  }

  @override
  void initState() {
    _changeNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Center(
            child: Text(
              _number,
              style: const TextStyle(color: Colors.white, fontSize: 36),
            ),
          ),
          Positioned(
              top: 40,
              child: Image.asset(
                "assets/graf.jpg",
                height: 240.0,
                fit: BoxFit.cover,
              )),
          Positioned(
            bottom: 40,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            side: const BorderSide(color: Colors.white)))),
                onPressed: _changeNumber,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36.0),
                  child: Text(
                    'Get',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
