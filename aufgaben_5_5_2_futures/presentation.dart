import 'dart:async';

Future<String> fetchUserName() {
  return Future.delayed(Duration(seconds: 3), () {
    return "Mario";
  });
}

Future<void> getWelcomeMessage() async {
  String userName = await fetchUserName();
  String welcomeMessage = "Willkommen in unserer App, $userName!";
  print(welcomeMessage);
}

void main() {
  getWelcomeMessage();
}
