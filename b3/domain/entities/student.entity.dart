import 'base.entity.dart';
import '../value_objects/email.vo.dart';
import '../value_objects/phone.vo.dart';

class Student extends BaseEntity {
  final String fName;
  final String lName;
  final DateTime birthday;
  final PhoneVO phone;
  final EmailVO email;

  Student({
    required String id,
    required this.fName,
    required this.lName,
    required this.birthday,
    required this.phone,
    required this.email,
  }) : super(id);

  String get fullName => "$fName $lName";

  @override
  String toString() {
    return 'Student: $fullName | Phone: ${phone.value} | Email: ${email.value} | DOB: $birthday';
  }
}
