import '../../domain/entities/student.dart';
import '../../domain/enums/student_status.dart';
import '../../domain/value_objects/student_age.dart';
import '../../domain/value_objects/student_email.dart';
import '../../domain/value_objects/student_name.dart';

class StudentPersistenceMapper {
  static Student toEntity(Map<String, dynamic> row) {
    return Student(
      id: row['id'] as int,
      name: StudentName(row['name'] as String),
      email: StudentEmail(row['email'] as String),
      age: StudentAge(row['age'] as int),
      status: StudentStatus.values.byName(row['status'] as String),
      favoriteSubjects: List<String>.from(row['favorite_subjects'] ?? []),
    );
  }

  static Map<String, dynamic> toDbMap(Student entity) {
    return {
      'name': entity.name.value,
      'email': entity.email.value,
      'age': entity.age.value,
      'status': entity.status.name,
      'favorite_subjects': entity.favoriteSubjects,
    };
  }
}