class Business {
  String? id;
  String description;
  String? image;
  String name;
  String address;
  String email;
  String? logo;
  String subCategoryId;
  String? website;
  String? facebook;
  String? instagram;
  String? twitter;
  String? phone;
  String? hours;
  String? owner;
  String? ownerName;
  bool isApproved;
  double? latitude;
  double? longitude;
  double? distance;
  List<String> videos;
  List<String> images;
  String? uploaderId;

  Business({
    this.id,
    required this.description,
    required this.image,
    required this.name,
    required this.address,
    required this.email,
    required this.logo,
    required this.subCategoryId,
    this.website,
    this.facebook,
    this.instagram,
    this.twitter,
    this.phone,
    this.hours,
    this.owner,
    this.ownerName,
    required this.isApproved,
    this.latitude,
    this.longitude,
    this.distance,
    required this.images,
    required this.videos,
    required this.uploaderId,
  });

  factory Business.fromMap(Map<String, dynamic> map) {
    List<String> imagesList = [];
    List<String> videosList = [];

    if (map['images'] != null) {
      map['images'].forEach((e) => imagesList.add(e));
    }

    if (map['videos'] != null) {
      map['videos'].forEach((e) => videosList.add(e));
    }

    return Business(
      id: map['id'],
      description: map['description'] ?? '',
      image: map['image'] ?? null,
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      email: map['email'] ?? '',
      logo: map['logo'] ?? null,
      subCategoryId: map['subCategoryId'] ?? '',
      website: map['website'] ?? null,
      facebook: map['facebook'] ?? null,
      instagram: map['instagram'] ?? null,
      twitter: map['twitter'] ?? null,
      phone: map['phone'] ?? null,
      hours: map['hours'] ?? null,
      owner: map['owner'] ?? null,
      isApproved: map['isApproved'] ?? false,
      ownerName: map['ownerName'] ?? null,
      latitude: map['latitude'] ?? null,
      longitude: map['longitude'] ?? null,
      images: imagesList,
      videos: videosList,
      uploaderId: map['uploaderId'] ?? null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'image': image,
      'name': name,
      'address': address,
      'email': email,
      'logo': logo,
      'subCategoryId': subCategoryId,
      'website': website,
      'facebook': facebook,
      'instagram': instagram,
      'twitter': twitter,
      'phone': phone,
      'hours': hours,
      'owner': owner,
      'ownerName': ownerName,
      'isApproved': isApproved,
      'latitude': latitude,
      'longitude': longitude,
      'images': images,
      'videos': videos,
      'uploaderId': uploaderId,
    };
  }
}
