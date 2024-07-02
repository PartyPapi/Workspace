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
          title: Text('Layout mit Row und Columns'),
        ),
        body: RowMitColumns(),
      ),
    );
  }
}

class RowMitColumns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
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
