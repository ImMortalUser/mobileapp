import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;

  TaskDetailScreen({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              task.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(task.description),
          ],
        ),
      ),
    );
  }
}
