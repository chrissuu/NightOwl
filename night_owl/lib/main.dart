import 'package:flutter/material.dart';
import 'package:night_owl/feed.dart';
import 'package:night_owl/callScreen.dart';
import 'package:night_owl/login.dart';
import 'package:night_owl/profile_page.dart';
import 'package:night_owl/signup.dart';
import 'package:night_owl/upload_photo.dart';
import 'package:night_owl/start_screen.dart';
import 'package:night_owl/profile_grid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Night Owl',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProfileGrid(),
    );
  }
}
