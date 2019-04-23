import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hey there',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Hey there'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List colors = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.white,
    Colors.grey,
    Colors.teal,
    Colors.cyan,
    Colors.blue,
    Colors.brown,
    Colors.lime,
    Colors.indigo,
    Colors.lightBlueAccent,
    Colors.black
  ];
  Random random = new Random();

  int index = 0;

  void changeIndex() {
    setState(() => index = random.nextInt(11));
  }

  @override
  Widget build(BuildContext context) {
    FlutterTts flutterTts = new FlutterTts();
    Future _speak() async {
      await flutterTts.setLanguage('en-US');
      await flutterTts.speak(colors[index].toString());
    }

    return Scaffold(
      body: InkWell(
          onTap: () => {_speak(), changeIndex()},
          child: Container(
              decoration: new BoxDecoration(
                color: colors[index],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Hey there',
                      style: TextStyle(
                        fontSize: 50.0,
                        color: colors[index+1],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
