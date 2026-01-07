import '../entities/student.entity.dart';

abstract class StudentRepository {
  Future<Student> getStudentById(String id);
}
