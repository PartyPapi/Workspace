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
          title: Text('Komplexe Benutzeroberfläche'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Titel'),
          content: Text('jetzt folgt eine Snackbar'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
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
      SnackBar(
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
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
        Divider(),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.message, color: Colors.green),
                SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                      'Zweite Karte: Drücke den Button für eine Snackbar.'),
                ),
                TextButton(
                  child: Text('Button'),
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
