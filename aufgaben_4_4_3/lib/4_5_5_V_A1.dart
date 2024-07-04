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
          title: const Text('Red Container with Snackbar'),
        ),
        body: const Center(
          child: RedContainer(),
        ),
      ),
    );
  }
}

class RedContainer extends StatelessWidget {
  const RedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        const snackBar = SnackBar(
          content: Text('Container was tapped!'),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
      ),
    );
  }
}
