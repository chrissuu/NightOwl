import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:night_owl/photo_no_cam.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({
    super.key,
    // required this.camera
  });

  // final CameraDescription camera;

  @override
  State<FeedScreen> createState() => MyFeedScreenState();
}

class Post {
  String postTitle;
  String date;
  String postID;

  Post({
    required this.postTitle,
    required this.date,
    required this.postID,
  });
}

class MyFeedScreenState extends State<FeedScreen> {
  List<Post> postList = [];

  void _addTask() {
    setState(() {
      Post temp = Post(
          date:  "February 3rd, 9:20 pm",
          postID: (DateTime.now().millisecondsSinceEpoch).toString(),
          postTitle: "amanda23"+ "                    ");

      postList.add(temp);
      print("test");
    });
  }
  // void _addTask() {
  //   setState(() {
  //     Post
  //    tempTask = Post
  //   (
  //       postTitle: taskName,
  //       taskCompleted: false,
  //       taskID: (DateTime.now().millisecondsSinceEpoch).toString(),
  //     );

  //     postList.add(tempTask);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    _addTask();
    return Scaffold(
        body: Center(
            child: Container(
                width:
                    MediaQuery.of(context).size.width * 0.90, //90% screen width
                height: MediaQuery.of(context).size.height *
                    0.75, // 80% of screen height
                padding: const EdgeInsets.all(0.0),
                child: ReorderableListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    onReorder: (int oldIndex, int newIndex) {
                      setState(() {
                        if (oldIndex < newIndex) {
                          newIndex -= 1;
                        }
                        final Post item = postList.removeAt(oldIndex);
                        postList.insert(newIndex, item);
                      });
                    },
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      postList.sort((a, b) => (a.date).compareTo(b.date));
                      String currPostID = postList[index].postID;
                      return Column(
                        key: Key(currPostID),
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width *
                                    0.90, //90% screen width
                                height: MediaQuery.of(context).size.height *
                                    0.65, // 80% of screen height
                                padding: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          color: Colors.white,
                                        ),
                                        child: Column(children: [
                                          Text(
                                            postList[postList.indexWhere((e) =>
                                                    e.postID == currPostID)]
                                                .postTitle,
                                            style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            postList[postList.indexWhere((e) =>
                                                    e.postID == currPostID)]
                                                .date,
                                            style: TextStyle(fontSize: 15.0),
                                          )
                                          
                                        ]),
                                      ),
                                    ),
                                    SizedBox(height: 20),

                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      child: InkWell(
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.75,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: Image.asset(
                                                'assets/dummy_images/image2.png',
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text('Add a comment...'),
                                    ),

                                    // Space for TextBox
                                  ],
                                ),
                              )),
                          SizedBox(height: 30),
                        ],
                      );
                    }))),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PhotoTakingScreenNoCam()),
            );
          },
          backgroundColor: Colors.purple[600],
          
          label: Text("   start   ", style: TextStyle(fontSize:15,color: Colors.white)),
        ));
  }
}
