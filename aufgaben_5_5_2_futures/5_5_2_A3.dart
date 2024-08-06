import 'dart:async';

Future<String> fetchGreeting() async {
  await Future.delayed(Duration(seconds: 2));
  return Future.error('500');
  //return "Come on, let's go!";
}

void main() {
  print("Starte Datenabruf...");

  fetchGreeting().then((greeting) {
    print(greeting);
    print("Datenabruf abgeschlossen.");
  }).catchError((error) {
    print("Gotta bad day, try again!");
  });

  print("Warte auf Daten...");
}
