class RegistrationModel {
  int? id;
  String firstName;
  String lastName;
  String email;
  String mobileNumber;
  String password;
  int yearOfPassing;
  String grade;
  int experience;
  String designation;
  String domain;
  String address;
  String zipCode;
  String landmark;
  String city;

  RegistrationModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
    required this.yearOfPassing,
    required this.grade,
    required this.address,
    required this.zipCode,
    required this.password,
    required this.experience,
    required this.designation,
    required this.domain,
    required this.city,
    required this.landmark
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'mobileNumber': mobileNumber,
      'yearOfPassing': yearOfPassing,
      'grade': grade,
      'address': address,
      'zipCode': zipCode,
      'password':password,
      "experience":experience,
      "designation":designation,
      "domain":domain,
      "city":city,
      "landmark":landmark
    };
  }


  factory RegistrationModel.fromMap(Map<String, dynamic> map) {
    return RegistrationModel(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      mobileNumber: map['mobileNumber'],
      yearOfPassing: map['yearOfPassing'],
      grade: map['grade'],
      address: map['address'],
      zipCode: map['zipCode'],
      password: map['password'],
      experience: map["experience"],
      designation: map["designation"],
      domain: map["domain"],
      city: map["city"],
      landmark: map["landmark"]
    );
  }
}
