import 'package:flutter/material.dart';
import '../models/task.dart';

class EditTaskScreen extends StatelessWidget {
  final Task task;
  final Function(String, String) onEdit;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  EditTaskScreen({required this.task, required this.onEdit})
      : titleController = TextEditingController(text: task.title),
        descriptionController = TextEditingController(text: task.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              autofocus: true,
            ),
            SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                final String newTitle = titleController.text;
                final String newDescription = descriptionController.text;
                onEdit(newTitle, newDescription);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
