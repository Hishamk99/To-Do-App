import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screen/home_page.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: const HomePage(),
    );
  }
}
