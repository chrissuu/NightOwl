import 'package:flutter/material.dart';
import 'package:night_owl/grid_view.dart';

class ProfileGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Night Owl', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(
            Icons.person_add,
            color: Colors.black,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            //profile photo
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),

            //username
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '@nightowl',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),

            //number of folowers, following
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: [
                        Text(
                          '20',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Following',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          '50',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Followers',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(
                          '9',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Posts',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),

            //bio
            Text(
              'Temp Bio Here',
              style: TextStyle(color: Colors.grey[700]),
            ),

            //photos
            Expanded(
                child: TabBarView(
              children: [
                FirstTab(),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
