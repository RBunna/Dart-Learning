import 'package:my_first_project/robot.dart';
import 'package:test/test.dart';

main() {
  test('Robot move Test 1', () {
    Robot robot = Robot(x: 7, y: 3, direction: Direction.north);
    robot.process(Action.parse("RAALAL"));

    print("FINAL POSITION = $robot");

    expect(robot.x, equals(9));
    expect(robot.y, equals(4));
    expect(robot.direction, equals(Direction.west));
  });
}
