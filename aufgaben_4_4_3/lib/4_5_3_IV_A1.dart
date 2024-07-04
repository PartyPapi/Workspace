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
          title: const Text('Row mit festen und dynamischen Breiten'),
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
