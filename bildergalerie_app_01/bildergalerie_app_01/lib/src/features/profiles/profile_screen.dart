import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/Ralf_Podchull_1.jpg'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ralf Podchull',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.justify,
            ),
            Text('(Video-)DeeJay',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.justify),
            const SizedBox(height: 20),
            Text(
              'Mein Name ist Ralf (PartyPapi) Podchull. Ich bin seit 1985 DeeJay und seit 1993 als Solcher auch in der Gastronomie zu finden. Ich habe diverse Großveranstaltungen begleitet, regelmäßige Radiosendungen live gefahren und war im DJ-Sektor für viele Jahre Product Specialist, Deutsche Anlaufstelle für den Support von Mixvibes und habe in diesen Funktionen bis nach Brüssel Workshops gegeben.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
