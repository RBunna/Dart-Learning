class Person {
  String firstName;
  String lastName;

  Person({required this.firstName, required this.lastName});

  String get fullname => firstName + " " + lastName;
}
