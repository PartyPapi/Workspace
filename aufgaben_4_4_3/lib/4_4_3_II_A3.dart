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
          title: Text('Icon und Text in einer Row'),
        ),
        body: IconTextRow(),
      ),
    );
  }
}

class IconTextRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
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
