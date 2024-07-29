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
          title: const Text('Scrollable List of Text Widgets'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(20, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Item ${index + 1}',
                  style: const TextStyle(fontSize: 18),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
