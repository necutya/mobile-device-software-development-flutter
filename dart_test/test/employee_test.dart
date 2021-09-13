import 'package:dart_test/employee.dart';
import 'package:test/test.dart';

void testPersonal() {}

void main() {
  test('test_personal_create_by_name', () {
    var obj = Personal.fromName('Artem Lebedev');
    assert(obj.first_name == 'Artem');
    assert(obj.last_name == 'Lebedev');
  });

  test('test_personal_create_by_name_and_surname', () {
    var obj = Personal.fromNameAndSurname('Artem', 'Lebedev');
    assert(obj.first_name == 'Artem');
    assert(obj.last_name == 'Lebedev');
  });
}
