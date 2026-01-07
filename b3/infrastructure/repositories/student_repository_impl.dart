import '../../domain/entities/student.entity.dart';
import '../../domain/repositories/i_student_repository.dart';
import '../mappers/student_mapper.dart';
import '../models/student_model.dart';

class StudentRepositoryImpl implements StudentRepository {
  @override
  Future<Student> getStudentById(String id) {
    print("Wait connect API..............");
    return Future.delayed(const Duration(seconds: 2), () {
      final Map<String, dynamic> rawJsonResponse = {
        'id': 'STUDENT_001',
        'first_name': 'Le',
        'last_name': 'Thanh Vinh',
        'birthday': '2001-06-05',
        'phone_number': '0983620221',
        'email_address': 'vinhle5620@gmail.com',
      };
      final model = StudentModel.fromJson(rawJsonResponse);
      print("Mapping raw data to entity");
      return StudentMapper.toEntity(model);
    });
  }
}
