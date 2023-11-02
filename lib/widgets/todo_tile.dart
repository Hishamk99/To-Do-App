import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      required this.onChanged,
      required this.taskCompleted,
      required this.taskName});
  final String taskName;
  final bool taskCompleted;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Checkbox(value: taskCompleted, onChanged: onChanged),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(taskName),
          ),
        ],
      ),
    );
  }
}
