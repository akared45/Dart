import '../../domain/repositories/i_student_repository.dart';
import '../dtos/student_request_dto.dart';
import '../dtos/student_response_dto.dart';

class GetStudentUseCase {
  final StudentRepository student_repository;
  GetStudentUseCase(this.student_repository);
  Future<StudentResponseDTO> execute(StudentRequestDTO request) {
    return student_repository.getStudentById(request.studentId).then((entity) {
      return StudentResponseDTO(
        id: entity.id,
        fullName: entity.fullName.toUpperCase(),
        email: entity.email.value,
        phoneNumber: entity.phone.value,
        formattedBirthday: "${entity.birthday.year}",
      );
    });
  }
}
