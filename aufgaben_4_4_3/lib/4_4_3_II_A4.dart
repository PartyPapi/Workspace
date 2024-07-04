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
          title: const Text('Layout mit Row und Columns'),
        ),
        body: const RowMitColumns(),
      ),
    );
  }
}

class RowMitColumns extends StatelessWidget {
  const RowMitColumns({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Column 1, Text 1'),
                Text('Column 1, Text 2'),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Column 2, Text 1'),
                Text('Column 2, Text 2'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
