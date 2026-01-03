import '../../domain/exceptions/notfound_exception.dart';
import '../../domain/repositories/i_student_repository.dart';
import '../dtos/subject_registration_dto.dart';
import '../interfaces/i_register_subjects_use_case.dart';

class RegisterSubjectsUseCase implements IRegisterSubjectsUseCase {
  final IStudentRepository repository;

  RegisterSubjectsUseCase(this.repository);

  @override
  Future<void> execute(SubjectRegistrationDTO registration) async {
    final student = await repository.getById(registration.studentId);
    if (student == null) {
      throw NotFoundException(
          "Student with ID ${registration.studentId} not found.");
    }

    await repository.updateFavoriteSubjects(
        registration.studentId, registration.subjects);
  }
}
