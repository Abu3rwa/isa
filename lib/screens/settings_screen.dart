import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const settingssScreenRoute = "/settingssScreenRoute";

  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: const Text(
          'ISA School',
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Container(
        color: Colors.blueGrey[50],
        height: double.infinity,
        child: const SingleChildScrollView(
          child: Center(child: Text("settings page")),
        ),
      ),
    );
  }
}
