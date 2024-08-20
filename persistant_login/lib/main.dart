import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UsernameScreen(), //wird als erstes screen angezeigt
    );
  }
}

class UsernameScreen extends StatefulWidget {
  //stateful weil sich der Zustand während der Laufzeit ändert
  @override
  _UsernameScreenState createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  //im UsernameScreen wird der eigentliche Zustand verwaltet. Der Stat ist der Zustand dazu
  TextEditingController _controller =
      TextEditingController(); //der Controller wird verwendet, um das Textfeld zu steuern
  String _username =
      ''; //Der STring speichert den Nuternamen oder lädt diesen aus den SP

  @override
  void initState() {
    //wird einmalig beim Starten des Widgets aufgerufen bevor das Widget geändert wird.
    super.initState();
    _loadUsername(); //wird aufgerufen, um den gespeicherten Namen aus den SP zu laden
  }

  void _loadUsername() async {
    //Die Methode ruft den Namen aus den SP auf
    SharedPreferences prefs =
        await SharedPreferences.getInstance(); //Instanz der SP wird abgerufen
    setState(() {
      _username = prefs.getString('username') ??
          ''; //lädt den gespeicherten Wert unter 'username'. ??: falls kein Wert: Leerer String wird zurückgegeben
      _controller.text =
          _username; // Setze den geladenen Benutzernamen ins Eingabefeld
    });
  }

  void _saveUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username',
        username); // speichert den übergebenen Namen unter 'username'
    setState(() {
      _username = username;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Baut die Struktur auf mit Hilfe das Scaffolds
    return Scaffold(
      appBar: AppBar(
        title: Text('Username App'), //Baut die AppBar mit dem Titel
      ),
      body: Padding(
        //... um den Inhalt herum
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //vertikale Anordnung
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              //Das Eingabefeld, vom Controller gesteuert
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter your username'),
              onSubmitted: (value) {
                //Speichert die Eingabe beim Drücken der Entertaste
                _saveUsername(value);
              },
            ),
            SizedBox(height: 20), //Abstabndshalter
            Text(
              //zeigt den aus den SP geladenen Nutzer an
              'Stored Username: $_username',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
