class StudentModel {
  final String sId;
  final String fName;
  final String lName;
  final String dob;
  final String phoneNum;
  final String emailAdd;

  StudentModel({
    required this.sId,
    required this.fName,
    required this.lName,
    required this.dob,
    required this.phoneNum,
    required this.emailAdd,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      sId: json['id'] ?? '',
      fName: json['first_name'] ?? '',
      lName: json['last_name'] ?? '',
      dob: json['birthday'] ?? '',
      phoneNum: json['phone_number'] ?? '',
      emailAdd: json['email_address'] ?? '',
    );
  }
}
