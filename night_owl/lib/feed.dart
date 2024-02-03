import 'package:flutter/material.dart';
import 'dart:ui';


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

  Post ({
    required this.postTitle,
    required this.date,
    required this.postID,
  });
}

class MyFeedScreenState extends State<FeedScreen> {
  
  List<Post> postList = [];



  // void _addTask() {
  //   setState(() {
  //     Post
  //    tempTask = Post
  //   (
  //       title: taskName,
  //       taskCompleted: false,
  //       taskID: (DateTime.now().millisecondsSinceEpoch).toString(),
  //     );

  //     todoList.add(tempTask);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width * 0.90, //90% screen width
        height:
            MediaQuery.of(context).size.height * 0.8, // 80% of screen height
        padding: const EdgeInsets.all(0.0),

        child: ReorderableListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
      
          proxyDecorator: (child, index, animation) => 
          Material(
            shape: CircleBorder(eccentricity: 1),
            child: child,
          ),
          // Material(
          //   child:child
          // ),

          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final Post
             item = todoList.removeAt(oldIndex);
              todoList.insert(newIndex, item);
            });
          },
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            todoList.sort((a, b) =>
                (a.taskCompleted ? 1 : 0).compareTo(b.taskCompleted ? 1 : 0));
            String currTaskID = todoList[index].taskID;
            return 
            SwipeableTile.swipeToTriggerCard(
                color: (todoList.firstWhere((item)=>item.taskID == currTaskID).taskCompleted
                            ? const Color.fromARGB(255, 123, 114, 114)
                            : const Color.fromARGB(
                                255, 0, 0, 0)),
                shadow: BoxShadow(
                  color: Colors.black.withOpacity(0),
                  blurRadius: 0,
                  offset: Offset(0, 0),
                ),
                horizontalPadding: 2,
                swipeThreshold: 0.425,
                verticalPadding: 4,
                key: Key(currTaskID), 
                direction: SwipeDirection.horizontal ,
                backgroundBuilder: (context, direction, progress) {
                  if (direction == SwipeDirection.endToStart) {
                    return 
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red, // color of the task
                          borderRadius:
                              BorderRadius.circular(20.0), //how round the task is
                        ),
                        padding: const EdgeInsets.all(16.0),
                      );
                  } else {
                    return 
                      Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 118, 105, 104), // color of the task
                            borderRadius:
                                BorderRadius.circular(20.0), //how round the task is
                          ),
                          padding: const EdgeInsets.all(16.0),
                      );
                  }
                },
                onSwiped: (direction) {
                  if (direction == SwipeDirection.endToStart) {
                    _deleteTask(currTaskID);
                  } else if (direction == SwipeDirection.startToEnd) {
                    //photo endpoint
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder:(context) => PhotoTakingScreenNoCam(),)
                    );
                    // _deleteTask(currTaskID);
                    setState(() {
                      todoList[todoList.indexWhere((item) =>item.taskID ==currTaskID)].taskCompleted = true;
                    });
                  }
                },
                child:
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: (todoList[index].taskCompleted
                              ? const Color.fromARGB(255, 123, 114, 114)
                              : const Color.fromARGB(
                                  255, 0, 0, 0)), // color of the task
                          borderRadius:
                              BorderRadius.circular(20.0), //how round the task is
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: TaskBox(todoList[index].taskID),
                        )),
                  )
            );
          },
        ),
      )),
      floatingActionButton: AddTaskButton(),
    );
  }

  FloatingActionButton AddTaskButton() {
    return FloatingActionButton(
      onPressed: () async {
        final taskName = await openDialog();

        if (taskName == null || taskName.isEmpty) return;

        setState(() {
          this.taskName = taskName;
        });
        _addTask();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }

  List<Widget> TaskBox(String taskID) {
    int tempInd = todoList.indexWhere((item) =>item.taskID == taskID);
    return [
      InkWell(
          onTap: () {
            setState(() {
              todoList[tempInd].taskCompleted = !todoList[tempInd].taskCompleted;
            });
          },
          child: Container(
            width: 10.0,
            height: 10.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          )),
      Expanded(
          child: 
            Container(
            padding: const EdgeInsets.only(left: 10),
            child: 
              TextField(
                controller: TextEditingController.fromValue(TextEditingValue(
                    text: todoList[tempInd].title,
                    selection: TextSelection.collapsed(
                        offset: todoList[tempInd].title.length))),
                onChanged: (newTitle) {
                  setState(() {
                    todoList[tempInd].title = newTitle;
                  });
                },
                style: TextStyle(
                  color: Colors.white,
                  decoration: todoList[tempInd].taskCompleted
                      ? TextDecoration.lineThrough
                      : null,
                ),
                textDirection: TextDirection.ltr,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            )
       )
    ];
  }
}
