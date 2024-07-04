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
          title: const Text('Icon und Text in einer Row'),
        ),
        body: const IconTextRow(),
      ),
    );
  }
}

class IconTextRow extends StatelessWidget {
  const IconTextRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.headphones, size: 24.0),
          SizedBox(width: 8),
          Text('DeeJay', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
