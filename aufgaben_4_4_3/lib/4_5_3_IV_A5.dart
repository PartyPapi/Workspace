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
          title: const Text('Komplexe Benutzeroberfläche'),
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Titel'),
          content: const Text('jetzt folgt eine Snackbar'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                _showSnackbar(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Dies ist eine Snackbar-Nachricht.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () => _showAlertDialog(context),
          child: const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.info, color: Colors.blue),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                        'Erste Karte: Tippe hier, um einen AlertDialog zu sehen.'),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Divider(),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                const Icon(Icons.message, color: Colors.green),
                const SizedBox(width: 16.0),
                const Expanded(
                  child: Text(
                      'Zweite Karte: Drücke den Button für eine Snackbar.'),
                ),
                TextButton(
                  child: const Text('Button'),
                  onPressed: () => _showSnackbar(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
