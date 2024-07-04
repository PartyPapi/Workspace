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
          title: const Text('Textliste mit Dividern'),
        ),
        body: const TextListeMitDividern(),
      ),
    );
  }
}

class TextListeMitDividern extends StatelessWidget {
  const TextListeMitDividern({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
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
