import 'dart:math';

import 'package:dart_test/employee.dart';
import 'package:dart_test/extentions.dart';
import 'package:dart_test/shapes.dart';

void employees() {
  var developerFact = makeDeveloper();
  var employees = [];
  var employees_json = [
    {'name': 'Jim Halpert', 'salary': 2000.0},
    {'name': 'Mickle Scott', 'salary': 3000.0},
    {'name': 'Pam Beesly', 'salary': 2000.0},
    {'name': 'Dwight Schrute', 'salary': 1110.0},
  ];
  for (var employee in employees_json) {
    employees.add(developerFact(employee['name'], employee['salary']));
  }
  // Print all employees with salary 2000
  for (var emploee2k
      in employees.where((employee) => employee.salary == 2000.0)) {
    emploee2k.print_info();
  }

  // Check if any employee has salary more than 5k
  var has_5k = employees.any((employee) => employee.salary > 5000.0);
  print('Are there employees with salary more than 5k: $has_5k');

  // Check if any employee has salary more than 5k
  var every_1k = employees.every((employee) => employee.salary > 1000.0);
  print('Are there every employee has salary more than 1k: $every_1k');
}

void shapes() {
  var rnd_gen = Random();
  var shapes = <Shape>[];
  for (var i = 0; i < 100; i++) {
    Shape shape;
    var rnd = rnd_gen.nextInt(3);
    switch (rnd) {
      case 0:
        shape = Shape(Shapes.circle, Color.red, rnd_gen.nextInt(100));
        break;
      case 1:
        shape = Shape(Shapes.square, Color.green, rnd_gen.nextInt(100));
        break;
      case 2:
        shape = Shape(Shapes.square, Color.blue, rnd_gen.nextInt(100));
        break;
      default:
        throw 'Can\'t create shape.';
    }
    shapes.add(shape);
  }

  var big_or_blue_el = shapes.firstWhereOrNull((shape) => shape.area > 9000);
  big_or_blue_el ??=
      shapes.firstWhereOrNull((shape) => shape.color == Color.blue);
  big_or_blue_el?.draw();
}

void main(List<String> arguments) {
  // employees();
  shapes();
}
