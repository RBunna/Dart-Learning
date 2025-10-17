import 'dart:io';

void main() {
  // Map of pizza prices
  const pizzaPrices = {'margherita': 5.5, 'pepperoni': 7.5, 'vegetarian': 6.5};

  // Example order
  const order = ['margherita', 'pepperoni', 'pineapple'];

  // Your code
  double price = 0;
  for (String item in order) {
    if (!pizzaPrices.containsKey(item)) {
      print("$item is not on the menu");
      exit(0);
    }
    price += pizzaPrices[item]!;
  }
  print("Total: \$$price");
}
