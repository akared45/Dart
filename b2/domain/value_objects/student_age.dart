import '../exceptions/validation_exception.dart';

class StudentAge {
  final int value;

  StudentAge(this.value) {
    if (value <= 18) {
      throw ValidationException("Must be over 18 years old");
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is StudentAge && other.value == value);

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value.toString();
}
