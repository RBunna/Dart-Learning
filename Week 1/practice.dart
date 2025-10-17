main() {
  // int num = 0;
  // print((num % 2 == 0) ? "Even" : "Odd");
  print(sum(num1: 2, num2: 2));
  print(square(2.5));
}

double square(double number) => number * number;

void order(String item, [String? note]) {}

int sum({required int? num1, required int? num2}) {
  return num1! + num2!;
}
