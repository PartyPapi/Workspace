import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scrollable List of Text Widgets'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(20, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Item ${index + 1}',
                  style: TextStyle(fontSize: 18),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
