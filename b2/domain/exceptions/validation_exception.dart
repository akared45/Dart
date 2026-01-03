import 'student_exception.dart';

class ValidationException extends StudentDomainException {
  ValidationException(String message) : super("Error data: $message");
}