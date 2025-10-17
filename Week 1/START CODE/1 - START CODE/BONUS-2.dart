main() {
  List<String> stack = <String>[];

  const List<String> samples = ["{what is (42)}?", "[text}", "{[[(a)b]c]d}"];

  for (String sample in samples) {
    for (int index = 0; index < sample.length; index++) {
      switch (sample[index]) {
        case '{':
        case '[':
        case '(':
          stack.add(sample[index]);
          break;
        case '}':
          if (stack.last == '{') {
            stack.removeLast();
          }
          break;
        case ']':
          if (stack.last == '[') {
            stack.removeLast();
          }
          break;
        case ')':
          if (stack.last == '(') {
            stack.removeLast();
          }
          break;
      }
    }
    print(stack.isEmpty ? "Balanced" : "Not balanced");
    stack.clear();
  }
}
