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
          title: const Text('Row mit Card und Expanded Widgets'),
        ),
        body: Center(
          child: Row(
            children: <Widget>[
              Card(
                child: Container(
                  width: 100.0,
                  padding: const EdgeInsets.all(16.0),
                  child: const Text('Card 1'),
                ),
              ),
              Expanded(
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: const Text('Expanded Card'),
                  ),
                ),
              ),
              Card(
                child: Container(
                  width: 100.0,
                  padding: const EdgeInsets.all(16.0),
                  child: const Text('Card 2'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
