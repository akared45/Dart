import '../dtos/student_response_dto.dart';

abstract class IGetStudentUseCase {
  Future<List<StudentResponseDTO>> getAll();
  Future<List<StudentResponseDTO>> search(String query);
  Future<List<StudentResponseDTO>> getExpelled();
}