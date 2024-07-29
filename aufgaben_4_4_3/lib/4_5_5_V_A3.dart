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
          title: const Text('Persistent Bottom Sheet Example'),
        ),
        body: const Center(
          child: OpenBottomSheetButton(),
        ),
      ),
    );
  }
}

class OpenBottomSheetButton extends StatelessWidget {
  const OpenBottomSheetButton({super.key});

  void _showPersistentBottomSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'This is a persistent bottom sheet',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close'),
                  ),
                  const Icon(Icons.info, size: 24.0),
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
      child: const Text('Show Persistent Bottom Sheet'),
    );
  }
}
