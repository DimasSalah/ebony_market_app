class UserModel {
  String uid;
  String email;
  String fullName;
  String? profileImg;
  String? ethnicity;
  String? birthday;
  String? role;

  UserModel({
    required this.uid,
    required this.email,
    required this.fullName,
    this.profileImg,
    this.ethnicity,
    this.birthday,
    this.role,
  });

  //recieve data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      fullName: map['fullName'],
      profileImg: map['profileImg'],
      ethnicity: map['ethnicity'] ?? null,
      birthday: map['birthday'],
      role: map['role'] ?? null,
    );
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'profileImg': profileImg,
      'ethnicity': ethnicity == '' ? null : ethnicity,
      'birthday': birthday,
      'role': role,
    };
  }
}
