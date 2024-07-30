import 'package:flutter/material.dart';
import 'message_screen.dart';
import 'welcome_screen.dart';
import 'custom_form_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
      home: const MessageScreen(),
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/custom_form': (context) => const CustomFormScreen(),
      },
    );
  }
}
