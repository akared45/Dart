import '../exceptions/validation_exception.dart';

class StudentName {
  final String value;

  StudentName(this.value) {
    if (value.trim().isEmpty) {
      throw ValidationException("The student's name cannot be left blank");
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is StudentName && other.value == value);

  @override
  String toString() => value;
}
