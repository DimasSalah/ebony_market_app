class BusinessModel {
  final String id;
  final String name;
  final String category;
  final String subCategory;
  final String description;
  final String address;
  final String phone;
  final String email;
  final String ownerName;
  final String logo;
  final String banner;
  final List<String> images;
  final Map<String, Map<String, String>> operatingHours;
  final int reviewCount;

  BusinessModel({
    required this.id,
    required this.name,
    required this.category,
    required this.subCategory,
    required this.description,
    required this.address,
    required this.phone,
    required this.email,
    required this.ownerName,
    required this.logo,
    required this.banner,
    required this.images,
    required this.operatingHours,
    required this.reviewCount,
  });
}
