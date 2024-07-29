import 'package:flutter/material.dart';
import '../image_detail_screen.dart';

class GalleryScreen extends StatelessWidget {
  final List<String> images = [
    'assets/images/90er Foerderturm Boenen mit Leon (Licht).jpg',
    'assets/images/90er Party in Hamm (1).jpg',
    'assets/images/90er Party in Hamm.jpg',
    'assets/images/eigene Hochzeit in der Nacht.jpg',
    'assets/images/Firmenjahrestreffen Gütersloh.jpg',
    'assets/images/Foerderturm Boenen 2.jpg',
    'assets/images/Hallohparkfest.jpg',
    'assets/images/Hochzeit Wilshaus.jpg',
    'assets/images/Lichtwerk.jpg',
    'assets/images/Moderation Hallohparkfest (2).jpg',
    'assets/images/Ralf_Podchull_1.jpg',
    'assets/images/Rock n Roll.jpg',
  ];

  GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ImageDetailScreen(imagePath: images[index]),
              ),
            );
          },
          child: Hero(
            tag: images[index],
            child: Image.asset(
              images[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
