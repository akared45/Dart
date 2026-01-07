import '../../application/dtos/student_request_dto.dart';
import '../../application/dtos/student_response_dto.dart';
import '../../application/use_cases/get_student_usecase.dart';

class StudentController {
  final GetStudentUseCase _getStudentUseCase;
  bool isLoading = false;
  String? errMessage;
  StudentResponseDTO? studentData;

  StudentController(this._getStudentUseCase);

  void loadStudent(String Id) {
    isLoading = true;
    errMessage = null;
    print('Loading......');
    final request = StudentRequestDTO(studentId: Id);
    _getStudentUseCase
        .execute(request)
        .then((response) {
          studentData = response;
          isLoading = false;
          print("Update Info");
          _render();
        })
        .catchError((error) {
          errMessage = "Cannot get info: $error";
          isLoading = false;
          _render();
        });
  }

  void _render() {
    if (isLoading) return;
    if (errMessage != null) {
      print("Error: $errMessage");
    } else if (studentData != null) {
      print("Information Student:");
      print("   - Name: ${studentData!.fullName}");
      print("   - Email: ${studentData!.email}");
      print("   - Dob: ${studentData!.formattedBirthday}");
    }
  }
}
