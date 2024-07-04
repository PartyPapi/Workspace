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
          title: Text('Persistent Bottom Sheet Example'),
        ),
        body: Center(
          child: OpenBottomSheetButton(),
        ),
      ),
    );
  }
}

class OpenBottomSheetButton extends StatelessWidget {
  void _showPersistentBottomSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'This is a persistent bottom sheet',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Close'),
                  ),
                  Icon(Icons.info, size: 24.0),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showPersistentBottomSheet(context),
      child: Text('Show Persistent Bottom Sheet'),
    );
  }
}
