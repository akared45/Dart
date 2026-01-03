import 'dart:io';
import '../controllers/student_controller.dart';

class StudentView {
  final StudentController _controller;

  StudentView(this._controller);

  Future<void> showMenu() async {
    while (true) {
      print('\n======= STUDENT MANAGEMENT SYSTEM =======');
      print('1. View all students');
      print('2. Search students (Name/Email)');
      print('3. Add new student');
      print('4. Register favorite subjects');
      print('5. View expelled students');
      print('6. Exit');
      stdout.write('Choose an option: ');

      String? choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          await _controller.handleDisplayAll();
          break;

        case '2':
          stdout.write('Enter search query name ');
          String query = stdin.readLineSync() ?? '';
          await _controller.handleSearch(query);
          break;

        case '3':
          stdout.write('Enter student name: ');
          String name = stdin.readLineSync() ?? '';
          stdout.write('Enter email: ');
          String email = stdin.readLineSync() ?? '';
          stdout.write('Enter age: ');
          int age = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
          await _controller.handleCreateStudent(name, email, age);
          break;

        case '4':
          stdout.write('Enter student ID: ');
          int id = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
          stdout.write('Enter subjects (separated by commas): ');
          String subjectsInput = stdin.readLineSync() ?? '';
          List<String> subjects =
              subjectsInput.split(',').map((e) => e.trim()).toList();
          await _controller.handleRegisterSubjects(id, subjects);
          break;

        case '5':
          await _controller.handleDisplayExpelled();
          break;

        case '6':
          print('Exiting... Goodbye!');
          return;

        default:
          print('Invalid choice. Please try again.');
      }
    }
  }
}
