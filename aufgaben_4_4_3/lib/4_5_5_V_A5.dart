import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cards with Icon and Text'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              CustomCard(
                icon: Icons.home,
                text: 'Home',
              ),
              SizedBox(height: 16.0),
              CustomCard(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomCard({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Icon(icon, size: 40.0),
            const SizedBox(width: 16.0),
            Text(
              text,
              style: const TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
