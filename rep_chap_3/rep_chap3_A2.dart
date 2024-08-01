import 'dart:io';

void main() {
  print('Geben Sie eine Zahl ein:');
  String? input = stdin.readLineSync();

  int myNumber;
  try {
    myNumber = int.parse(input!);
  } catch (e) {
    print('Bitte geben Sie eine gültige Zahl ein.');
    return;
  }

  int sum = 0;
  for (int i = 1; i <= myNumber; i++) {
    sum += i;
  }

  print('Die Summe der natürlichen Zahlen von 1 bis $myNumber ist $sum.');
}
