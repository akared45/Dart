import '../../application/dtos/student_request_dto.dart';
import '../../application/interfaces/i_create_student_usecase.dart';
import '../../application/interfaces/i_get_student_usecase.dart';
import '../../application/interfaces/i_register_subjects_use_case.dart';
import '../../application/dtos/subject_registration_dto.dart';

class StudentController {
  final ICreateStudentUseCase _createUseCase;
  final IGetStudentUseCase _getUseCase;
  final IRegisterSubjectsUseCase _registerUseCase;

  StudentController(
      this._createUseCase, this._getUseCase, this._registerUseCase);

  Future<void> handleCreateStudent(String name, String email, int age) async {
    try {
      final request = StudentRequestDTO(name: name, email: email, age: age);
      final response = await _createUseCase.execute(request);
      print('Student create: [ID: ${response.id}] ${response.name}');
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> handleDisplayAll() async {
    try {
      final students = await _getUseCase.getAll();
      if (students.isEmpty) {
        print('Nothing to display');
        return;
      }
      print('\n--- STUDENT LIST ---');
      for (var s in students) {
        print('[ID: ${s.id}] ${s.name} - ${s.email} (${s.status})');
      }
    } catch (e) {
      print('Error displaying: $e');
    }
  }

  Future<void> handleRegisterSubjects(
      int studentId, List<String> subjects) async {
    try {
      final dto =
          SubjectRegistrationDTO(studentId: studentId, subjects: subjects);
      await _registerUseCase.execute(dto);
      print('Subjects registered for student ID: $studentId');
    } catch (e) {
      print('Error registering subjects: $e');
    }
  }

  Future<void> handleSearch(String query) async {
    try {
      final students = await _getUseCase.search(query);
      _printList(students, "Search result: '$query'");
    } catch (e) {
      print('Error searching: $e');
    }
  }

  Future<void> handleDisplayExpelled() async {
    try {
      final students = await _getUseCase.getExpelled();
      _printList(students, "Expelled Students");
    } catch (e) {
      print("Error displaying: $e");
    }
  }

  void _printList(List<dynamic> students, String title) {
    print('\n--- $title ---');
    if (students.isEmpty) {
      print('Nothing to display');
      return;
    }
    for (var s in students) {
      print(
          '[ID: ${s.id}] ${s.name} - ${s.email} | Môn: ${s.favoriteSubjects.join(", ")}');
    }
  }
}
