class StudentResponseDTO {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String formattedBirthday;

  StudentResponseDTO({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.formattedBirthday,
  });
}
