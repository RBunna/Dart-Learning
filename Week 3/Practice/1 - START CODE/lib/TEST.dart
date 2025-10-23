import 'package:uuid/data.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/rng.dart';

void main() {
  var uuid = Uuid();

  // Generate a v1 (time-based) id
  // var v1 = uuid.v1(); // -> '6c84fb90-12c4-11e1-840d-7b25c5ee775a'
  // var old_v1 = v1;
  // print(v1);
  // v1 = uuid.v1();
  // print(v1);
  // print(v1 == old_v1);
  // print(DateTime.now());
  var arr = [1, 2, 3, 4, 5];
  print(arr.fold(0, (acc, element) => acc + element).toInt());
}
