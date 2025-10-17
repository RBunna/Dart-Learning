enum DeliveryMethod { delivered, pickUp }

class Product {
  String _name;
  int _id;
  double price;

  Product(this._id, this._name, this.price);

  String get name => _name;
  int get id => _id;
}

class Order {
  int id;
  Map<Product, int> products;
  DeliveryMethod? method;

  Order({required this.id, this.method, required this.products});

  double get totalPrice {
    double price = 0;
    this.products.forEach((product, quantity) {
      price += product.price * quantity.toDouble();
    });
    return price;
  }

  void addProduct(Product product, int quantity) {
    if (products.containsKey(product))
      products.update(product, (qty) => qty += quantity);
    else
      products.addAll({product: quantity});
  }
}

void main(List<String> args) {
  List<Product> products = <Product>[];
  for (var i = 1; i <= 5; i++) {
    products.add(Product(i, "Product $i", i * 1.2));
  }

  Order order1 = Order(
    id: 1,
    method: DeliveryMethod.pickUp,
    products: {products[0]: 2, products[2]: 1},
  );
  print(order1.totalPrice); // 2.4 + 3.6 = 6
}
