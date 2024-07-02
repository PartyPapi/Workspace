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
          title: Text('Textliste mit Dividern'),
        ),
        body: TextListeMitDividern(),
      ),
    );
  }
}

class TextListeMitDividern extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Ralf'),
          Divider(),
          Text('"PartyPapi"'),
          Divider(),
          Text('Podchull'),
        ],
      ),
    );
  }
}
