import 'dart:async';

Future<String> fetchUserName() async {
  await Future.delayed(Duration(seconds: 3));
  return "Ralf Podchull";
}

Future<String> fetchUserAge() async {
  await Future.delayed(Duration(seconds: 2));
  return "53 Jahre";
}

void main() {
  print("Starte Datenabruf...");

  fetchUserName().then((userName) {
    print("Name: $userName");
    return fetchUserAge();
  }).then((userAge) {
    print("Alter: $userAge");
    print("Datenabruf abgeschlossen.");
  });

  print("Warte auf Daten...");
}
