class Point {
  double x, y;

  Point({required this.x, required this.y});

  void translate({required double dx, required double dy}) {
    this.x += dx;
    this.y += dy;
  }

  @override
  String toString() {
    return "x: $x, y: $y";
  }
}

class ImmutablePoint {
  final double x, y;

  const ImmutablePoint({required this.x, required this.y});

  ImmutablePoint translate({required double dx, required double dy}) {
    return ImmutablePoint(x: this.x + dx, y: this.y + dy);
  }

  @override
  String toString() {
    return "x: $x, y: $y";
  }
}

class Rectangle {
  Point topLeft;
  Point bottomRight;

  Rectangle({required this.topLeft, required this.bottomRight});

  double get width => this.bottomRight.x - this.topLeft.x;
  // double getWidth() {
  //   return this.bottomRight.x - this.topLeft.x;
  // }

  double get height => this.topLeft.y - this.bottomRight.y;
  // double getHeight() {
  //   return this.topLeft.y - this.bottomRight.y;
  // }

  double get area => this.width * this.height;
  // double getArea() {
  //   return this.getWidth() * this.getHeight();
  // }
}

void main() {
  Point a = Point(x: 10, y: 20);
  Point b = Point(x: 100, y: 0);
  Rectangle r = Rectangle(topLeft: a, bottomRight: b);
  print(r.area);
}
