import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Produkte',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProdukteScreen(),
    );
  }
}

class ProdukteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produkte'),
      ),
      body: Center(
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
              builder: (context) => DetailScreen(),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details zu Hemd'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hemd',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 8),
            Text('Ein Hemd das wirklich gut passt'),
            SizedBox(height: 8),
            Text(
              'Preis: 49,99 €',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
