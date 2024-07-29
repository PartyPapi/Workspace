import 'package:flutter/material.dart';

class ImageDetailScreen extends StatelessWidget {
  final String imagePath;

  const ImageDetailScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Column(
        children: [
          Hero(
            tag: imagePath,
            child: Image.asset(
              imagePath,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Bildbeschreibung hier...',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
