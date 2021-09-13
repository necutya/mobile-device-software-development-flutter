class Personal {
  late String _first_name;
  late String _last_name;

  String get name => '$_first_name $_last_name';
  String get first_name => _first_name;
  String get last_name => _last_name;
  set name(String first_name) {
    var credentials = first_name.split(' ');
    _first_name = credentials.first;
    _last_name = credentials.last;
  }

  Personal.fromNameAndSurname(first_name, last_name)
      : _first_name = first_name,
        _last_name = last_name;

  Personal.fromName(String name) {
    var credentials = name.split(' ');
    _first_name = credentials.first;
    _last_name = credentials.last;
  }
}

class Employee {
  late Personal personal;
  late double salary;
  late String position;
  Employee(name, position, {double salary = 1000.0}) {
    this.salary = salary;
    this.position = position;
    personal = Personal.fromName(name);
  }

  void print_info() {
    print('Employee:');
    print('\tName: ${personal.name}');
    print('\tPosition: $position');
    print('\tSalary: $salary');
  }
}

Function makeDeveloper() {
  var position = 'developer';
  return (String name, double salary) => Employee(
        name,
        position,
        salary: salary,
      );
}
