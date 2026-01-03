import '../common/base.entity.dart';
import '../value_objects/student_name.dart';
import '../value_objects/student_email.dart';
import '../value_objects/student_age.dart';
import '../enums/student_status.dart';

class Student extends BaseEntity {
  final StudentName name;
  final StudentEmail email;
  final StudentAge age;
  final StudentStatus status;
  final List<String> favoriteSubjects;

  Student({
    int? id,
    required this.name,
    required this.email,
    required this.age,
    required this.status,
    this.favoriteSubjects = const [],
  }) : super(id: id);

  bool get isExpelled => status == StudentStatus.expelled;
}
