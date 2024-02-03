import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:night_owl/textfield_widget.dart';
import 'package:night_owl/user.dart';
import 'package:night_owl/user_preferences.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(
          children: [
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
          ],
        ),
      );
}
