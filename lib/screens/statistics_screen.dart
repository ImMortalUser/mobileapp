import 'package:flutter/material.dart';
import '../models/task.dart';

class StatisticsScreen extends StatelessWidget {
  final List<Task> tasks;

  StatisticsScreen({required this.tasks});

  @override
  Widget build(BuildContext context) {
    int totalTasks = tasks.length;
    int completedTasks = tasks.where((task) => task.isDone).length;
    int incompleteTasks = totalTasks - completedTasks;
    double completionPercentage = totalTasks > 0 ? (completedTasks / totalTasks) * 100 : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Статистика задач'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: ListTile(
                title: Text('Всего задач'),
                trailing: Text(totalTasks.toString()),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Выполненные задачи'),
                trailing: Text(completedTasks.toString()),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Невыполненные задачи'),
                trailing: Text(incompleteTasks.toString()),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Процент выполнения'),
                trailing: Text(completionPercentage.toStringAsFixed(2) + '%'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
