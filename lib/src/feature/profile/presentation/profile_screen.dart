import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 100),
            SizedBox(height: 20),
            Text('Steckbrief',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Erika Mustermann', style: TextStyle(fontSize: 18)),
            Text('32 Jahre', style: TextStyle(fontSize: 18)),
            Text('Adalbertstraße 5', style: TextStyle(fontSize: 18)),
            Text('Berlin', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Todos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        currentIndex: 1,
        onTap: (index) {},
      ),
    );
  }
}
