class CategoryModel {
  final String name;
  final List<String> subCategories;

  CategoryModel({
    required this.name,
    required this.subCategories,
  });

  factory CategoryModel.fromJson(MapEntry<String, dynamic> entry) {
    return CategoryModel(
      name: entry.key,
      subCategories: List<String>.from(entry.value as List),
    );
  }
}
