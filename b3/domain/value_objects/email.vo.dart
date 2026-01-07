import '../exceptions/invalid_email.exception.dart';

class EmailVO {
  final String value;

  EmailVO(String email) : value = email {
    if (email.isEmpty || !email.contains('@')) {
      throw InvalidEmailException();
    }
  }
}
