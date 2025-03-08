class UserModel {
  String uid;
  String email;
  String fullName;
  String? profileImg;
  String? ethnicity;
  String? birthday;
  String? role;
  String? bio;
  Map<String, String>? socialLinks;

  UserModel({
    required this.uid,
    required this.email,
    required this.fullName,
    this.profileImg,
    this.ethnicity,
    this.birthday,
    this.role,
    this.bio,
    this.socialLinks,
  });

  //recieve data from server
  factory UserModel.fromMap(map) {
    Map<String, String> socialLinksMap = {};
    if (map['socialLinks'] != null) {
      map['socialLinks'].forEach((key, value) {
        socialLinksMap[key.toString()] = value.toString();
      });
    }

    return UserModel(
      uid: map['uid'],
      email: map['email'],
      fullName: map['fullName'],
      profileImg: map['profileImg'],
      ethnicity: map['ethnicity'] ?? null,
      birthday: map['birthday'],
      role: map['role'] ?? null,
      bio: map['bio'],
      socialLinks: socialLinksMap.isNotEmpty ? socialLinksMap : null,
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
      'bio': bio,
      'socialLinks': socialLinks,
    };
  }

  // Create dummy user data
  static UserModel dummyUser() {
    return UserModel(
      uid: 'dummy-user-id',
      email: 'john.doe@example.com',
      fullName: 'John Doe',
      profileImg:
          'https://img.freepik.com/free-photo/medium-shot-man-posing-outside_23-2149028795.jpg?t=st=1740988628~exp=1740992228~hmac=a7877e41047e07be9e276337df08b09d3c002b07632819f10c43afb750d36364&w=1060',
      bio: 'Digital entrepreneur & tech enthusiast',
      socialLinks: {
        'Website': 'www.johndoe.com',
        'Instagram': '@johndoe',
        'Twitter': '@johndoe',
      },
      role: 'user',
    );
  }
}
