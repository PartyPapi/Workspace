import 'dart:async';

Future<String> fetchGreeting() async {
  await Future.delayed(Duration(seconds: 2));
  return "Hello World!";
}

void main() {
  print("Starte Datenabruf...");

  fetchGreeting().then((greeting) {
    print(greeting);
    print("Datenabruf abgeschlossen.");
  });

  print("Warte auf Daten...");
}
