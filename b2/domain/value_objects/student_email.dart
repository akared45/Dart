import '../exceptions/validation_exception.dart';

class StudentEmail {
  final String value;

  StudentEmail(this.value) {
    if (!value.contains('@') || !value.contains('.')) {
      throw ValidationException("The email format '$value' is invalid");
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is StudentEmail && other.value == value);

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}
