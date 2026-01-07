import '../exceptions/invalid_phone.exception.dart';

class PhoneVO {
  final String value;

  PhoneVO(String phone) : value = phone {
    final RegExp phoneReg = RegExp(r'^[0-9]{10}$');
    if (!phoneReg.hasMatch(phone)) {
      throw InvalidPhoneException();
    }
  }
}
