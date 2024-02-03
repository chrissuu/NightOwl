import 'package:night_owl/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:night_owl/user.dart';
import 'package:night_owl/user_preferences.dart';
import 'package:night_owl/edit_profile_page.dart';

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
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Center(
        child: Container(
            child: ListView(children: [
          Container(
              width:
                  MediaQuery.of(context).size.width * 0.90, //90% screen width
              height: MediaQuery.of(context).size.height *
                  0.75, // 80% of screen height
              padding: const EdgeInsets.all(0.0),
              child: ListView(children: [
                const SizedBox(height: 24),
                buildName(user),
                const SizedBox(height: 24),
                buildPoliceLabel(user),
                const SizedBox(height: 24),
                buildPolicePhoneNumber(user),
              ])),
          const SizedBox(height: 24),
          buildEditButton(),
        ])),
      ),
    );
  }

  Widget buildName(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ), // Text
            const SizedBox(height: 10),
            Text(
              user.phoneNumber,
              style: TextStyle(fontSize: 13, height: 1.4),
            ), //Text
          ],
        ),
      );

  Widget buildEditButton() => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        width: MediaQuery.of(context).size.width * 0.4, //90% screen width
        height:
            MediaQuery.of(context).size.height * 0.05, // 80% of screen height
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditProfilePage()),
            );
          },
          child: const Text(
            "Edit",
            style: TextStyle(fontSize: 20),
          ),
        ),
      );

  Widget buildPoliceLabel(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Emergency Police Contact',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ), // Text
            const SizedBox(height: 10),
            Text(
              user.policeLabel,
              style: TextStyle(fontSize: 13, height: 1.4),
            ), //Text
            SizedBox(height: 5),
            Text(
              user.policePhoneNumber,
              style: TextStyle(fontSize: 13, height: 1.4),
            ),
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
              style: TextStyle(fontSize: 13, height: 1.4),
            ), //Text
          ],
        ),
      );
}
