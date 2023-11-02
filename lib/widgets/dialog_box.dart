import 'package:flutter/material.dart';
import 'package:tode_app/widgets/cutom_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSaved,});
  final TextEditingController controller;
  final VoidCallback onSaved;
  final VoidCallback onCancel;
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[600],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Add a new task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                CustomButton(
                  text: 'Save',
                  onPressed: onSaved,
                ),
                const SizedBox(
                  width: 10,
                ),
                // cancel button
                CustomButton(
                  text: 'Cancel',
                  onPressed: onCancel,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
