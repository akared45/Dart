import 'student_exception.dart';

class ConflictException extends StudentDomainException {
  ConflictException(String message) : super("Operational conflicts: $message");
}