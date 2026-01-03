class StudentResponseDTO {
  final int? id;
  final String name;
  final String email;
  final int age;
  final String status;
  final List<String> favoriteSubjects;

  StudentResponseDTO({
    this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.status,
    required this.favoriteSubjects,
  });
}