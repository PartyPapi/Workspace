import 'dart:async';

void main() {
  Future.wait([fetchUserName(), fetchUserAge()]).then((results) {
    results.forEach((result) {
      if (result is String) {
        print("Name: $result");
      } else if (result is int) {
        print("Alter: $result");
      }
    });
  }).catchError((error) {
    print("Gotta bad day, try again!");
  });
}

Future<String> fetchUserName() {
  return Future.error('500');
  //return Future.delayed(Duration(seconds: 3), () => "Ralf Podchull");
}

Future<int> fetchUserAge() {
  return Future.delayed(Duration(seconds: 2), () => 53);
}
