import '../../domain/entities/student.dart';
import '../../domain/enums/student_status.dart';
import '../../domain/exceptions/conflict_exception.dart';
import '../../domain/exceptions/student_exception.dart';
import '../../domain/repositories/i_student_repository.dart';
import '../../domain/value_objects/student_age.dart';
import '../../domain/value_objects/student_email.dart';
import '../../domain/value_objects/student_name.dart';
import '../dtos/student_request_dto.dart';
import '../dtos/student_response_dto.dart';
import '../interfaces/i_create_student_usecase.dart';

class CreateStudentUseCase implements ICreateStudentUseCase {
  final IStudentRepository repository;

  CreateStudentUseCase(this.repository);

  @override
  Future<StudentResponseDTO> execute(StudentRequestDTO request) async {
    final emailVO = StudentEmail(request.email);
    final ageVO = StudentAge(request.age);
    final nameVO = StudentName(request.name);
    final existingStudent = await repository.findByEmail(emailVO.value);
    if (existingStudent != null) {
      throw ConflictException(
          "Email '${emailVO.value}' already exists in system.");
    }

    final student = Student(
      name: nameVO,
      email: emailVO,
      age: ageVO,
      status: StudentStatus.active,
      favoriteSubjects: [],
    );

    await repository.add(student);
    return StudentResponseDTO(
      name: student.name.value,
      email: student.email.value,
      age: student.age.value,
      status: student.status.name,
      favoriteSubjects: [],
    );
  }
}
