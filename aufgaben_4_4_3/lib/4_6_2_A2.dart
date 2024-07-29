import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const AppHome(),
    );
  }
}

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const NewsScreen(),
    const LikesScreen(),
    const ProfileScreen(),
  ];

  void onDestinationSelected(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyApp'),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onDestinationSelected,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.article, size: 100),
          Text('News', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}

class LikesScreen extends StatelessWidget {
  const LikesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity, // Take up full width available
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.start, // Align content at the top vertically
        crossAxisAlignment:
            CrossAxisAlignment.center, // Center content horizontally
        children: <Widget>[
          SizedBox(height: 20), // Space from the top
          Text(
            'Hier findest du deine gelikten Nachrichten.',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center, // Center text horizontally
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity, // Take up full width available
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.start, // Align content at the top vertically
        crossAxisAlignment:
            CrossAxisAlignment.center, // Center content horizontally
        children: <Widget>[
          SizedBox(height: 20), // Space from the top
          Icon(Icons.person, size: 100),
          SizedBox(height: 20), // Space between Icon and Text
          Text(
            'Max Mustermann',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center, // Center text horizontally
          ),
        ],
      ),
    );
  }
}
