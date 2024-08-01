void main() {
  String username = "admin"; // Beispielwert für den Benutzernamen
  String password = "1234"; // Beispielwert für das Passwort

  if (username == "admin" && password == "1234") {
    print("Zugang gewährt");
  } else if (username == "admin" && password != "1234") {
    print("Falsches Passwort");
  } else {
    print("Unbekannter Benutzer");
  }
}
