import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        appBarTheme: AppBarTheme(
          backgroundColor: isDarkMode ? Colors.grey[850] : Colors.blue,
        ),
      ),
      home: HomeScreen(toggleTheme: toggleTheme, isDarkMode: isDarkMode),
      debugShowCheckedModeBanner: false,
    );
  }
}
