import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tode_app/constant.dart';
import 'package:tode_app/data/database.dart';
import 'package:tode_app/widgets/dialog_box.dart';
import 'package:tode_app/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myBox = Hive.box(boxName);
  ToDoDataBase data = ToDoDataBase();
  @override
  void initState() {
    if (myBox.get(keyBox) == null) {
      data.createInitialData;
    } else {
      data.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      data.toDoList[index][1] = !data.toDoList[index][1];
    });
    data.updateDataBase();
  }

  final controller = TextEditingController();
  void saveNewTask() {
    setState(() {
      data.toDoList.add([controller.text, false]);
      controller.clear();
    });
    Navigator.of(context).pop();
    data.updateDataBase();
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      data.toDoList.removeAt(index);
    });
    data.updateDataBase();
  }

  // craete a new task
  void craeteNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: controller,
            onCancel: () => Navigator.of(context).pop(),
            onSaved: saveNewTask,
          );
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
        itemCount: data.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
              onChanged: (value) => checkBoxChanged(value, index),
              taskCompleted: data.toDoList[index][1],
              taskName: data.toDoList[index][0],
              deleteFunction: (context) => deleteTask(index));
        },
      ),
    );
  }
}
