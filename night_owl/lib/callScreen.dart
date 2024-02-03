import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:night_owl/start_screen.dart';

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

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    _start();
  }

  void _start() {
    print("started!");
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
      await player.open(
        Audio(
            "assets/audio/7120-download-iphone-6-original-ringtone-42676.mp3"),
      );
      await Future.delayed(Duration(seconds: 3));
    } while (_ringing);
  }

  void _stopRing() {
    player.stop();
    _ringing = false;
  }

  void _reset() {
    player.stop();
    _ringing = false;
  }

  @override
  Widget build(BuildContext context) {
    print("building?!");
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
                            heroTag: "btn1",
                            child: Icon(Icons.call_end, size: 34),
                            backgroundColor: Colors.red,
                            shape: CircleBorder(),
                            onPressed: () => Navigator.pop(context)),
                      ),
                      Text("Decline", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        child: FloatingActionButton(
                            heroTag: "btn2",
                            child: Icon(Icons.phone, size: 34),
                            backgroundColor: Colors.green,
                            shape: CircleBorder(),
                            onPressed: () => Navigator.pop(context)),
                      ),
                      Text("Accept", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 60),
            ],
          ),
        ],
      ),
    );
  }
}
