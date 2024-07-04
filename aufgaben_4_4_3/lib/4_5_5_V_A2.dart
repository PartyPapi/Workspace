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
          title: const Text('Modal Bottom Sheet Example'),
        ),
        body: const Center(
          child: OpenBottomSheetButton(),
        ),
      ),
    );
  }
}

class OpenBottomSheetButton extends StatelessWidget {
  const OpenBottomSheetButton({super.key});

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Erkennst Du PartyPapi?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Schließen'),
              ),
              const SizedBox(height: 10),
              Image.network(
                'https://partypapi.de/____impro/1/onewebmedia/Ralf_Podchull_1.JPG',
                height: 100,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showModalBottomSheet(context),
      child: const Text('Zeige Bild'),
    );
  }
}
