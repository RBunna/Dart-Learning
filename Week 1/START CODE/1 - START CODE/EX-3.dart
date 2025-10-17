void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  // You code
  var passed = scores.where((element) => element >= 50);
  print(passed.toList());
  print("${passed.length} students passed");
}
