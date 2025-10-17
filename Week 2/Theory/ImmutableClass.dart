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
