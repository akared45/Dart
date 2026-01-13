import '../exceptions/validation.exception.dart';

class Age {
  final int value;

  const Age._(this.value);

  factory Age(int value) {
    if (value < 0) {
      throw ValidationException('Age cannot be negative');
    }

    if (value > 150) {
      throw ValidationException('Age is unrealistically high');
    }

    return Age._(value);
  }

  @override
  String toString() => value.toString();
}
