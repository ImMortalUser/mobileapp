import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('О приложении'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Icon(
                Icons.info,
                size: 100.0,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'To-Do App',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Text(
              'Версия 1.0.0',
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Text(
              'To-Do App помогает вам управлять вашими задачами эффективно и организованно. '
                  'Создавайте, редактируйте и удаляйте задачи, устанавливайте напоминания и следите за своей продуктивностью.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20.0),
            Text(
              'Связаться с нами:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Text(
              'support@todoapp.com',
              style: TextStyle(fontSize: 16.0, color: Colors.blue),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
