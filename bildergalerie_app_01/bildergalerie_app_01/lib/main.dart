import 'package:flutter/material.dart';
import 'src/features/profiles/profile_screen.dart';
// import 'src/features/todos/widget_screen.dart';

void main() {
  runApp(const AppHome());
}

class BildergalerieApp extends StatelessWidget {
  const BildergalerieApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bildergalerie App',
      home: const AppHome(),
      routes: {
        '/details': (context) => const DetailScreen(),
      },
    );
  }
}

class AppHome extends StatefulWidget {
  const AppHome({super.key});
  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int currentPageIndex = 0;
  final List<Widget> screens = [
    const NewsScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MyGallery",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(54, 57, 59, 1),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromARGB(255, 155, 160, 163),
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.newspaper), label: 'Bilder'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Über mich'),
        ],
      ),
      body: Center(
        child: screens[currentPageIndex],
      ),
    );
  }
}
