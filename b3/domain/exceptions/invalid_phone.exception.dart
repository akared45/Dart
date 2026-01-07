import 'domain.exception.dart';

class InvalidPhoneException extends DomainException {
  InvalidPhoneException() : super("Invalid phone number");
}