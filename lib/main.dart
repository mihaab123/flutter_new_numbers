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
  String _counter = "";
  var rng = Random();

  void _incrementCounter() {
    setState(() {
      _counter = (rng.nextDouble() * 10).toStringAsFixed(2);
    });
  }

  @override
  void initState() {
    _incrementCounter();
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
              _counter,
              style: const TextStyle(color: Colors.white, fontSize: 36),
            ),
          ),
          Positioned(
            bottom: 40,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            side: const BorderSide(color: Colors.white)))),
                onPressed: _incrementCounter,
                child: const Text(
                  'Change number',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
          )
        ],
      ),
    );
  }
}
