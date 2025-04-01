class EventModel {
  final String image;
  final String name;
  final String date;
  final String location;
  final String price;
  final String? description;
  final double distance;
  final String category;

  EventModel(
      {required this.image,
      required this.name,
      required this.date,
      required this.location,
      required this.price,
      required this.distance,
      required this.category,
      this.description});
}
