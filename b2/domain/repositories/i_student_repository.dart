import '../common/i_repository.dart';
import '../entities/student.dart';
import '../enums/student_status.dart';

abstract class IStudentRepository extends IRepository<Student, int?> {
  Future<List<Student>> searchByNameOrEmail(String query);
  Future<Student?> findByEmail(String email);
  Future<List<Student>> getByStatus(StudentStatus status);
  Future<void> updateFavoriteSubjects(int studentId, List<String> subjects);
}