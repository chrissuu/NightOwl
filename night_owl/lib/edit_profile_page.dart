import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:night_owl/textfield_widget.dart';
import 'package:night_owl/user.dart';
import 'package:night_owl/user_preferences.dart';
import 'package:night_owl/profile_page.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.90, //90% screen width
            height: MediaQuery.of(context).size.height *
                0.75, // 80% of screen height
            padding: const EdgeInsets.all(0.0),
            child: ListView(
              children: [
                Center(
                  child: Text(
                    "Edit Settings",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Name',
                  text: user.name,
                  onChanged: (name) {},
                ), //TextFieldWidget
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Phone Number',
                  text: user.phoneNumber,
                  onChanged: (phoneNumber) {},
                ), //TextFieldWidget
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Police Label',
                  text: user.policeLabel,
                  onChanged: (policeLabel) {},
                ), //TextFieldWidget
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Police Phone Number',
                  text: user.policePhoneNumber,
                  onChanged: (policePhoneNumber) {},
                ), //TextFieldWidget
                const SizedBox(height: 24),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width *
                      0.4, //90% screen width
                  height: MediaQuery.of(context).size.height *
                      0.05, // 80% of screen height
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ));
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
