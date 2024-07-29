import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Produkte',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProdukteScreen(),
    );
  }
}

class Produkt {
  final String name;
  final String beschreibung;
  final double preis;

  Produkt({
    required this.name,
    required this.beschreibung,
    required this.preis,
  });
}

class ProdukteScreen extends StatelessWidget {
  const ProdukteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Produkt produkt = Produkt(
      name: 'Hemd',
      beschreibung: 'Ein Hemd das wirklich gut passt',
      preis: 49.99,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Produkte'),
      ),
      body: const Center(
        child: Text(
          'Schaue ein schönes Produkt an,\nindem du auf den FAB drückst',
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(produkt: produkt),
            ),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Produkt produkt;

  const DetailScreen({super.key, required this.produkt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details zu ${produkt.name}'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              Text(
                produkt.name,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                produkt.beschreibung,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Preis: ${produkt.preis.toStringAsFixed(2)} €',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
