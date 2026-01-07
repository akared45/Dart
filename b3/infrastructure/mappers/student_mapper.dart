import '../../domain/entities/student.entity.dart';
import '../../domain/value_objects/email.vo.dart';
import '../../domain/value_objects/phone.vo.dart';
import '../models/student_model.dart';

class StudentMapper {
  static Student toEntity(StudentModel model) {
    return Student(
      id: model.sId,
      fName: model.fName,
      lName: model.lName,
      birthday: DateTime.parse(model.dob),
      phone: PhoneVO(model.phoneNum),
      email: EmailVO(model.emailAdd),
    );
  }
}
