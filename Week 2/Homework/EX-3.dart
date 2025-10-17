import 'dart:io';

class Duration {
  final int __milliseconds;

  Duration._(this.__milliseconds) {
    if (this.__milliseconds <= 0) {
      print("Duration should be greater than 0");
      exit(1);
    }
  }
  Duration.fromHours(int hours) : this._(hours * 60 * 60 * 1000);
  Duration.fromMinutes(int minutes) : this._(minutes * 60 * 1000);
  Duration.fromSeconds(int seconds) : this._(seconds * 1000);

  bool operator >(Duration that) => this.__milliseconds > that.__milliseconds;

  Duration operator +(Duration another) {
    return Duration._(this.__milliseconds + another.__milliseconds);
  }

  Duration minus(Duration another) {
    return Duration._(this.__milliseconds - another.__milliseconds);
  }
}

void main(List<String> args) {
  Duration one = Duration.fromHours(1);
  Duration two = Duration.fromSeconds(3601);

  print(two.minus(one).__milliseconds);
}
