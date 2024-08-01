void main() {
  int myNumber = 10;
  int sum = 0;

  List<int> numbers = List.generate(myNumber, (index) => index + 1);

  numbers.forEach((number) {
    sum += number;
  });

  print("Die Summe aller natürlichen Zahlen von 1 bis $myNumber ist $sum.");
}
