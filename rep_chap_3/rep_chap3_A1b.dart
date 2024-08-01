import 'dart:io';

void main() {
  print('Geben Sie eine Schulnote (zwischen 1 und 6) ein:');
  String? input = stdin.readLineSync();
  int grade;
  try {
    grade = int.parse(input!);
  } catch (e) {
    print('Bitte geben Sie eine gültige Zahl ein.');
    return;
  }

  String message = checkGrade(grade);
  print(message);
}

String checkGrade(int grade) {
  if (grade == 1 || grade == 2) {
    return 'Sehr gut';
  } else if (grade == 3 || grade == 4) {
    return 'Gut';
  } else if (grade == 5 || grade == 6) {
    return 'Verbesserungswürdig';
  } else {
    return 'Ungültige Note';
  }
}
