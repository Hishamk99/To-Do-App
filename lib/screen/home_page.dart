import 'package:flutter/material.dart';
import 'package:tode_app/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> toDoList = [
    ['Make Tutorial', true],
    ['Do Excersize', false],
  ];
  void CheckBoxChanged(bool? value , int index) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[300],
      appBar: AppBar(
        elevation: 0,
        title: const Text('TO DO'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            onChanged: (value) => CheckBoxChanged(value , index),
            taskCompleted: toDoList[index][1],
            taskName: toDoList[index][0],
          );
        },
      ),
    );
  }
}
// TodoTile(
//             onChanged: (value) {},
//             taskCompleted: true,
//             taskName: 'Make Tutorial',
//           ),
//           TodoTile(
//             onChanged: (value) {},
//             taskCompleted: false,
//             taskName: 'Do Exersize',
//           ),