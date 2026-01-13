import 'domain.exception.dart';

class ValidationException extends DomainException {
  const ValidationException([super.message = 'Invalid data']);
}