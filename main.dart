
import 'dart:convert';
import 'dart:io';

// Step 1 define an interface
abstract class Printable {
  void printDetails();
}

// Step 2 create a base class
class Person implements Printable {
  late String name;
  late int age;

  Person(this.name, this.age);

  @override
  void printDetails() {
    print("Name: $name, Age: $age");
  }
}

// Step 3: Create a derived class that overrides an inherited method
class Employee extends Person {
  String position;

  Employee(String name,int age, this.position) : super(name, age);

  @override
  void printDetails() {
    print("Name: $name, Age: $age, Position: $position");
  }

  // Step 5: Method demonstrating the use of a loop
  void showYearsUntilRetirement(int retirementAge) {
    int yearsLeft = retirementAge - age;
    print('$name has $yearsLeft years until retirement.');
    print('Years left:');
    for (int i = 1; i <= yearsLeft; i++) {
      print(i);
    }
  }
}

// Step 4: Initialize an instance of a class with data from a file
Future<Employee> loadEmployeeFromFile(String filePath) async {
  final file = File(filePath);
  final contents = await file.readAsString();
  final data = jsonDecode(contents);
  return Employee(data['name'], data['age'], data['position']);
}

void main() async {
  // Path to the JSON file containing employee data
  String filePath = 'employee.json';

  // Initialize Employee instance from file
  Employee employee = await loadEmployeeFromFile(filePath);

  // Use the methods from the classes
  employee.printDetails();
  employee.showYearsUntilRetirement(65);
}

