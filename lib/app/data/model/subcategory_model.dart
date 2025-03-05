class SubCategory {
  String id;
  String image;
  String name;

  SubCategory({
    required this.image,
    required this.name,
    required this.id,
  });

  factory SubCategory.fromMap(map) {
    return SubCategory(
      image: map['image'],
      name: map['name'],
      id: map['id'],
    );
  }
}
