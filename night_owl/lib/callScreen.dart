import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class callScreen extends StatefulWidget {
  const callScreen({super.key});

  @override
  State<callScreen> createState() => _MyCallScreenState();
}

class _MyCallScreenState extends State<callScreen> {
  final player = AssetsAudioPlayer();
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
  bool _startScreen = true;

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
      _startScreen = false;
    });
    _ring();
  }

  void _ring() async {
    _ringing = true;
    do {
      await player.open(
        Audio(
            "assets/audio/7120-download-iphone-6-original-ringtone-42676.mp3"),
      );
      await Future.delayed(Duration(seconds: 3));
    } while (_ringing);
  }

  void _stopRing() {
    player?.stop();
    _ringing = false;
  }

  void _reset() {
    player?.stop();
    _ringing = false;
    setState(() {
      _startScreen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _startScreen ? Colors.black : _backgroundColor,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                _caller,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
              Text(
                "mobile",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 2.2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.alarm, color: Colors.white, size: 30),
                      Text("Remind Me", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.message, color: Colors.white, size: 30),
                      Text("Message", style: TextStyle(color: Colors.white)),
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
                        onDoubleTap: _reset,
                        child: FloatingActionButton(
                            child: Icon(Icons.call_end, size: 34),
                            backgroundColor: Colors.red,
                            shape: CircleBorder(),
                            onPressed: null),
                      ),
                      Text("Decline", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        child: FloatingActionButton(
                            child: Icon(Icons.phone, size: 34),
                            backgroundColor: Colors.green,
                            shape: CircleBorder(),
                            onPressed: null),
                      ),
                      Text("Accept", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 60),
            ],
          ),
          if (_startScreen)
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(color: Colors.black),
                ),
                Expanded(
                  flex: 0,
                  child: GestureDetector(
                    onLongPress: _start,
                    child: Container(
                        width: double.infinity,
                        height: 60,
                        color: Colors.grey[900]),
                  ),
                )
              ],
            )
        ],
      ),
    );
  }
}
