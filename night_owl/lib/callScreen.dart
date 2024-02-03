import 'dart:math';

import 'package:flutter/material.dart';
import 'package:night_owl/flutter/packages/flutter/lib/services.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache cache = AudioCache();
  Color _backgroundColor = Color(0xFF163345);
  Random random = Random();
  String _caller = "";
  String areaCode = "512";
  String prefix = "";
  String lastFour = "";
  List callerList = [
    "Mom",
    "Dad",
    "Boyfriend",
    "Amanda",
  ];
  bool _ringing = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }

  void _start() {
    int callerIndex = random.nextInt(callerList.length);
    int pre = random.nextInt(899) + 100;
    int lf = random.nextInt(8999) + 1000;
    setState(() {
      prefix = pre.toString();
      lastFour = lf.toString();
      _caller = callerList[callerIndex];
    });
    _ring();
  }

  void _ring() async {
    _ringing = true;
    do {
      await audioPlayer.play(AssetSource('7120-download-iphone-6-original-ringtone-42676.mp3'));
      await Future.delayed(Duration(seconds: 3));
    } while (_ringing);
  }

  void _stopRing(){
    audioPlayer?.stop();
    _ringing = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                _caller,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50),
              ),
              Text(
                "$areaCode $prefix $lastFour",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 2.2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.alarm, color: Colors.white, size: 30),
                      Text("Remind Me"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.message, color: Colors.white, size: 30),
                      Text("Message"),
                    ],
                  )
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: _stopRing,
                        child: FloatingActionButton(
                            child: Icon(Icons.call_end, size: 34),
                            backgroundColor: Colors.red,
                            onPressed: null),
                      ),
                      Text("Decline"),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        child: FloatingActionButton(
                            child: Icon(Icons.phone, size: 34),
                            backgroundColor: Colors.green,
                            onPressed: null),
                      ),
                      Text("Accept"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 60),
              ElevatedButton(child: Text("TEMP START"), onPressed: _start),
            ],
          ),
        ],
      ),
    );
  }
}
