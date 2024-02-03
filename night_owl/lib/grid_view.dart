import 'package:flutter/material.dart';

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 9,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(2.0),
        child: Image.asset(
            'lib/dummy_images/image' + (index + 1).toString() + '.jpg'),
        // color: Colors.grey[200],
      ),
    );
  }
}
