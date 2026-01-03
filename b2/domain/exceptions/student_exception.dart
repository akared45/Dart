class StudentDomainException implements Exception {
  final String message;
  StudentDomainException(this.message);

  @override
  String toString() => message;
}