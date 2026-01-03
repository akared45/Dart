import 'student_exception.dart';

class NotFoundException extends StudentDomainException {
  NotFoundException(String message) : super("Not found: $message");
}