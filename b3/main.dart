import 'application/use_cases/get_student_usecase.dart';
import 'infrastructure/repositories/student_repository_impl.dart';
import 'presentation/controllers/student_controller.dart';

void main() {
  final studentRepository = StudentRepositoryImpl();
  final getStudentUseCase = GetStudentUseCase(studentRepository);
  final controller = StudentController(getStudentUseCase);
  controller.loadStudent("STUDENT_001");
}