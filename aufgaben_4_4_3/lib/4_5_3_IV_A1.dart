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
          title: Text('Row mit festen und dynamischen Breiten'),
        ),
        body: Center(
          child: Row(
            children: <Widget>[
              Container(
                width: 100.0,
                color: Colors.red,
              ),
              Expanded(
                child: Container(
                  color: Colors.green,
                ),
              ),
              Container(
                width: 100.0,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
