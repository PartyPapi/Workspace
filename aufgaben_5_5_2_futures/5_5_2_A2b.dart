void main() {
  Future.wait([fetchUserName(), fetchUserAge()]).then((results) {
    results.forEach((result) {
      print(result);
    });
  });
}

Future<String> fetchUserName() {
  return Future.delayed(Duration(seconds: 3), () => "Ralf Podchull");
}

Future<int> fetchUserAge() {
  return Future.delayed(Duration(seconds: 2), () => 53);
}
