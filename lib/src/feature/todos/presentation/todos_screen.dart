import 'package:flutter/material.dart';

class TodosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todos')),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('Einkauf erledigen'),
              subtitle:
                  Text('Milch, Brot, Gemüse und Obst im Supermarkt kaufen.'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Projekt abschließen'),
              subtitle:
                  Text('Finalen Bericht schreiben und Präsentation erstellen.'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Haus putzen'),
              subtitle: Text('Staub wischen, Boden saugen, und Bad putzen.'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Todos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        currentIndex: 0,
        onTap: (index) {},
      ),
    );
  }
}
