import '../../domain/enums/student_status.dart';
import '../../domain/repositories/i_student_repository.dart';
import '../dtos/student_response_dto.dart';
import '../interfaces/i_get_student_usecase.dart';

class GetStudentUseCase implements IGetStudentUseCase {
  final IStudentRepository repository;

  GetStudentUseCase(this.repository);

  @override
  Future<List<StudentResponseDTO>> getAll() async {
    final students = await repository.getAll();
    return students
        .map((student) => StudentResponseDTO(
              id: student.id,
              name: student.name.value,
              email: student.email.value,
              age: student.age.value,
              status: student.status.name,
              favoriteSubjects: student.favoriteSubjects,
            ))
        .toList();
  }

  @override
  Future<List<StudentResponseDTO>> search(String query) async {
    final results = await repository.searchByNameOrEmail(query);
    return results
        .map((student) => StudentResponseDTO(
              id: student.id,
              name: student.name.value,
              email: student.email.value,
              age: student.age.value,
              status: student.status.name,
              favoriteSubjects: student.favoriteSubjects,
            ))
        .toList();
  }

  @override
  Future<List<StudentResponseDTO>> getExpelled() async {
    final expelledOnes = await repository.getByStatus(StudentStatus.expelled);
    return expelledOnes
        .map((student) => StudentResponseDTO(
              id: student.id,
              name: student.name.value,
              email: student.email.value,
              age: student.age.value,
              status: student.status.name,
              favoriteSubjects: student.favoriteSubjects,
            ))
        .toList();
  }
}
