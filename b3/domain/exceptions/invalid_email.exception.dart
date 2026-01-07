import 'domain.exception.dart';

class InvalidEmailException extends DomainException {
  InvalidEmailException() : super("Invalid Email");
}
