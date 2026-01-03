import '../dtos/student_request_dto.dart';
import '../dtos/student_response_dto.dart';

abstract class ICreateStudentUseCase {
  Future<StudentResponseDTO> execute(StudentRequestDTO request);
}