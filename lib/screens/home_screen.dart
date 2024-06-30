import 'package:flutter/material.dart';
import '../models/task.dart';
import 'add_task_screen.dart';
import 'edit_task_screen.dart';
import 'task_detail_screen.dart';
import 'settings_screen.dart';
import 'statistics_screen.dart'; // Импортируем новый экран статистики
import 'about_screen.dart'; // Импортируем экран AboutScreen

class HomeScreen extends StatefulWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  HomeScreen({required this.toggleTheme, required this.isDarkMode});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  void addTask(String taskTitle, String taskDescription) {
    setState(() {
      tasks.add(Task(title: taskTitle, description: taskDescription));
    });
  }

  void editTask(int index, String newTitle, String newDescription) {
    setState(() {
      tasks[index].title = newTitle;
      tasks[index].description = newDescription;
    });
  }

  void toggleTask(Task task) {
    setState(() {
      task.toggleDone();
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void navigateToStatistics() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StatisticsScreen(tasks: tasks),
      ),
    );
  }

  void navigateToAbout() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AboutScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(
                    toggleTheme: widget.toggleTheme,
                    isDarkMode: widget.isDarkMode,
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.bar_chart),
            onPressed: navigateToStatistics,
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: navigateToAbout,
          ), // Добавляем кнопку для перехода к экрану о приложении
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(
              task.title,
              style: TextStyle(
                decoration: task.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            subtitle: Text(task.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: task.isDone,
                  onChanged: (value) {
                    toggleTask(task);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditTaskScreen(
                          task: task,
                          onEdit: (newTitle, newDescription) {
                            editTask(index, newTitle, newDescription);
                          },
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    deleteTask(index);
                  },
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskDetailScreen(task: task),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final Map<String, String>? newTask = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(),
            ),
          );
          if (newTask != null) {
            addTask(newTask['title']!, newTask['description']!);
          }
        },
      ),
    );
  }
}
