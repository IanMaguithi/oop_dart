class ClassRoom {
  String name;
  String age;

  ClassRoom(this.name, this.age);

  void printInformation() {
    print("Name is $name, Age is $age");
  }
}

class Teacher extends ClassRoom {
  String subject;

  Teacher(String name, String age, this.subject) : super(name, age);

  void printTeacherInformation() {
    print("Teacher's name is $name, Age is $age, Subject is $subject");
  }
}

class Student extends ClassRoom {
  String gradeLevel;

  Student(String name, String age, this.gradeLevel) : super(name, age);

  void printStudentInformation() {
    print("Student's name is $name, Age is $age, grade level is $gradeLevel");
  }
}

void main() {
  Student student = Student("Lexar", "18", "9th year");
  Teacher teacher = Teacher("Dr. Ken", "30", "Biomaterials");

  student.printInformation();
  student.printStudentInformation();
  teacher.printInformation();
  teacher.printTeacherInformation();
}
