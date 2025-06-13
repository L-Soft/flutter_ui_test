class UserInfo {
  int id;
  String firstName;
  String lastName;
  String email;
  String ipAddress;
  String company;

  UserInfo({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.ipAddress,
    required this.company,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'ip_address': ipAddress,
      'company': company,
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      email: map['email'],
      ipAddress: map['ip_address'],
      company: map['company'],
    );
  }
}

