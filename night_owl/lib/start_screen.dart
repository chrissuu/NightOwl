import 'package:flutter/material.dart';
import 'package:night_owl/callScreen.dart';

class startScreen extends StatefulWidget {
  const startScreen({super.key});

  @override
  State<startScreen> createState() => _MyStartScreenState();
}

class _MyStartScreenState extends State<startScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(color: Colors.black),
              ),
              Expanded(
                flex: 0,
                child: GestureDetector(
                  onLongPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => callScreen(),
                        ));
                  },
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
