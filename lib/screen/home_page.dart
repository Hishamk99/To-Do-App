import 'package:flutter/material.dart';
import 'package:tode_app/widgets/dialog_box.dart';
import 'package:tode_app/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> toDoList = [
    ['Make Tutorial', false],
    ['Do Excersize', false],
  ];
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }
  final controller = TextEditingController();
  void saveNewTask() {
    setState(() {
      toDoList.add([controller.text , false]);
      controller.clear();
    });
    Navigator.of(context).pop();
  }
  // craete a new task
  void craeteNewTask()
  {
    showDialog(context: context, builder: (context)
    {
    return DialogBox(controller: controller, onCancel: ()=> Navigator.of(context).pop(),
     onSaved: saveNewTask,);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: craeteNewTask,
        child: const Icon(Icons.add),
      ),
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
            onChanged: (value) => checkBoxChanged(value, index),
            taskCompleted: toDoList[index][1],
            taskName: toDoList[index][0],
          );
        },
      ),
    );
  }
}
