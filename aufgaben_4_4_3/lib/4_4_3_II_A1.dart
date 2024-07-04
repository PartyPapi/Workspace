import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bildergalerie'),
        ),
        body: const Bildergalerie(),
      ),
    );
  }
}

class Bildergalerie extends StatelessWidget {
  const Bildergalerie({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
              'https://partypapi.de/____impro/1/onewebmedia/Rock%20n%20Roll.JPG?etag=%224770d-5c35df3a%22&sourceContentType=image%2Fjpeg&ignoreAspectRatio&resize=324,182'),
          const SizedBox(height: 10),
          Image.network(
              'https://partypapi.de/____impro/1/onewebmedia/eigene%20Hochzeit%20in%20der%20Nacht.JPG?etag=%221cb07-5c35df2a%22&sourceContentType=image%2Fjpeg&ignoreAspectRatio&resize=324,182'),
          const SizedBox(height: 10),
          Image.network(
              'https://partypapi.de/____impro/1/onewebmedia/Mit%20Willi%20Herren.JPG?etag=%22d9e8-5c35df35%22&sourceContentType=image%2Fjpeg&ignoreAspectRatio&resize=273,182'),
        ],
      ),
    );
  }
}
