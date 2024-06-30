import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  // Контроллеры для текстовых полей
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Добавить задачу'),  // Заголовок на верхней панели
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Заголовок',  // Надпись для поля ввода заголовка
                border: OutlineInputBorder(),
              ),
              autofocus: true,
            ),
            SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Описание',  // Надпись для поля ввода описания
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                labelText: 'Срок выполнения',  // Надпись для поля ввода срока выполнения
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  dateController.text =
                  "${pickedDate.day}.${pickedDate.month}.${pickedDate.year}";  // Устанавливаем выбранную дату в поле ввода
                }
              },
              readOnly: true,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Добавить задачу'),  // Текст кнопки
              onPressed: () {
                final String taskTitle = titleController.text;
                final String taskDescription = descriptionController.text;
                if (taskTitle.isNotEmpty) {
                  Navigator.pop(context, {
                    'title': taskTitle,
                    'description': taskDescription,
                  });
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),  // Основной цвет кнопки
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),  // Цвет текста и иконок на кнопке
              ),
            ),
          ],
        ),
      ),
    );
  }
}
