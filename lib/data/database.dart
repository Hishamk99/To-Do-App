import 'package:hive_flutter/hive_flutter.dart';
import 'package:tode_app/constant.dart';

class ToDoDataBase
{
  List toDoList = [];

  final myBox = Hive.box('myBox');
   
  // when open the app
  void createInitialData()
  {
    toDoList = [
      ['Make Tutorial' , false],
      ['Do Excersize' , false],
    ];
  }
  // load data from database
  loadData()
  {
    toDoList = myBox.get(keyBox);
  }

  // update the database
  updateDataBase()
  {
    myBox.put(keyBox, toDoList);
  }
}