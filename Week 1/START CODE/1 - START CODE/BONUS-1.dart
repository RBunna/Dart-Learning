enum Direction { north, east, south, west }

void main() {
  // Initial position {7, 3} and facing north
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;

  // Example instruction sequence
  const instructions = "RAALAL";

  // Process the instructions and get the final position and direction
  for (int i = 0; i < instructions.length; i++) {
    switch (instructions[i]) {
      case 'R':
      case 'L':
        direction = turn(direction, instructions[i]);
        break;
      case 'A':
      // Since north and south are even number in term of their index
        if (direction.index % 2 == 0) {
          direction == Direction.north ? y++ : y--;
        } else {
          direction == Direction.east ? x++ : x--;
        }
        break;
    }
  }

  // Print the final position and direction
  print("Final position:  ($x, $y)");
  print("Facing:  $direction");
}

Direction turn(Direction direction, String instruction) {
  List<Direction> directionList = Direction.values;
  int directionIndex = direction.index;

  if (instruction == 'R' || instruction == 'L') {
    directionIndex += (instruction == 'R') ? 1 : 3;
  }
  return directionList.elementAt(directionIndex % 4);
}
