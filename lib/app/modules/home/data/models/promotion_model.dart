class Promotion {
  String imageUrl;

  Promotion({
    required this.imageUrl,
  });

  factory Promotion.fromMap(map) {
    return Promotion(imageUrl: map['imageUrl']);
  }

  
}
