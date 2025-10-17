enum Skill { FLUTTER, DART, OTHER }

class Address {
  String street;
  String city;
  int zipCode;

  Address(this.street, this.city, this.zipCode);

  @override
  String toString() {
    return "City: $city, Street: $street, ZIP: $zipCode";
  }
}

class Employee {
  String _name;
  double _baseSalary;
  List<Skill> _skills;
  Address _address;
  int _yearsOfExperience;

  Employee(
    this._name,
    this._baseSalary,
    this._skills,
    this._address,
    this._yearsOfExperience,
  );

  Employee.mobileDeveloper(
    this._name,
    this._baseSalary,
    this._address,
    this._yearsOfExperience,
  ) : this._skills = [Skill.DART, Skill.FLUTTER];

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  void printDetails() {
    print(
      'Employee: $_name, Base Salary: \$${_baseSalary}, Skills: ${_skills.toString()}',
    );
    print(
      'Address: ${_address.toString()}, Experience: $_yearsOfExperience year(s)\n',
    );
  }

  double totalSalary() {
    double skillBonus = 0;
    for (Skill skill in _skills) {
      skillBonus += (skill == Skill.FLUTTER)
          ? 5000
          : (skill == Skill.DART)
          ? 3000
          : 1000;
    }
    return _baseSalary + (_yearsOfExperience * 2000) + skillBonus;
  }
}

void main() {
  var emp1 = Employee(
    'Sokea',
    40000,
    [Skill.DART, Skill.OTHER],
    Address("123 st", "Phnom Penh", 1234),
    2,
  );
  emp1.printDetails();
  print(emp1.totalSalary()); // 40000 + 3000 + 1000 + 4000 = 48000

  var emp2 = Employee.mobileDeveloper(
    'Ronan',
    45000,
    Address("New st", "Phnom Penh", 1235),
    4,
  );
  emp2.printDetails();
  print(emp2.totalSalary()); // 45000 + 5000 + 3000 + 8000 = 61000
}
