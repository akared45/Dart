import '../dtos/subject_registration_dto.dart';

abstract class IRegisterSubjectsUseCase {
  Future<void> execute(SubjectRegistrationDTO registration);
}