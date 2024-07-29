import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 100.0,
            backgroundImage: AssetImage('assets/images/Ralf_Podchull_1.jpg'),
          ),
          SizedBox(height: 16.0),
          Text(
            'Ralf Podchull',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          Text(
            '(Video-)DeeJay',
            style: TextStyle(fontSize: 18.0, color: Colors.grey),
          ),
          SizedBox(height: 16.0),
          Text(
            'Mein Name ist Ralf (PartyPapi) Podchull. Ich bin seit 1985 DeeJay und seit 1993 als Solcher auch in der Gastronomie zu finden. Ich habe diverse Großveranstaltungen begleitet, regelmäßige Radiosendungen live gefahren und war im DJ-Sektor für viele Jahre Product Specialist, Deutsche Anlaufstelle für den Support von Mixvibes und habe in diesen Funktionen bis nach Brüssel Workshops gegeben.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
