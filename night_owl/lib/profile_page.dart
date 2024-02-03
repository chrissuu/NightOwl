import 'package:night_owl/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:night_owl/user.dart';
import 'package:night_owl/user_preferences.dart';

void main() {
  runApp(ProfilePage());
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      body: ListView(children: [
        const SizedBox(height: 24),
        buildName(user),
        buildEditButton(), // CHANGE THIS TO BE A MULTI SELECT OPTION
        const SizedBox(height: 24),
        buildPoliceLabel(user),
        const SizedBox(height: 24),
        buildPolicePhoneNumber(user),
      ]),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ), //Text
          const SizedBox(height: 4),
          Text(
            user.phoneNumber,
            style: TextStyle(color: Colors.grey),
          ) // Text
        ],
      );

  Widget buildEditButton() => ButtonWidget(
        text: 'Select your call Display',
        onClicked: () {},
      );

  Widget buildPoliceLabel(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Police Label',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ), // Text
            const SizedBox(height: 10),
            Text(
              user.policeLabel,
              style: TextStyle(fontSize: 10, height: 1.4),
            ), //Text
          ],
        ),
      );

  Widget buildPolicePhoneNumber(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Police Phone Number',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ), // Text
            const SizedBox(height: 10),
            Text(
              user.policePhoneNumber,
              style: TextStyle(fontSize: 10, height: 1.4),
            ), //Text
          ],
        ),
      );
}
