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
          title: Text('Row mit Card und Expanded Widgets'),
        ),
        body: Center(
          child: Row(
            children: <Widget>[
              Card(
                child: Container(
                  width: 100.0,
                  padding: EdgeInsets.all(16.0),
                  child: Text('Card 1'),
                ),
              ),
              Expanded(
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Expanded Card'),
                  ),
                ),
              ),
              Card(
                child: Container(
                  width: 100.0,
                  padding: EdgeInsets.all(16.0),
                  child: Text('Card 2'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
