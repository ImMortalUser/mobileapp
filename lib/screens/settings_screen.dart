import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  SettingsScreen({required this.toggleTheme, required this.isDarkMode});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            ListTile(
              title: Text('Change Theme'),
              trailing: Switch(
                value: widget.isDarkMode,
                onChanged: (value) {
                  widget.toggleTheme();
                },
              ),
              onTap: () {
                widget.toggleTheme();
              },
            ),
          ],
        ),
      ),
    );
  }
}
