import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: SnackishScreen(),
        ),
      ),
    );
  }
}

class SnackishScreen extends StatelessWidget {
  const SnackishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage('assets/images/jp_app_background_pinkpurple.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Text in Background
        Center(
          child: Text(
            'SNACK SNACK',
            style: TextStyle(
              fontSize: 60,
              color: Colors.white.withOpacity(0.1),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        // Image
        Center(
          child: Image.asset(
            'assets/images/Ralf_Podchull_1.jpg',
            width: 200,
            height: 200,
          ),
        ),
        // Overlay Text and Button
        Positioned(
          bottom: 50,
          left: 20,
          right: 20,
          child: Column(
            children: [
              const Text(
                'Feeling Snackish Today?',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: Colors.pinkAccent,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text('Order Now'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
