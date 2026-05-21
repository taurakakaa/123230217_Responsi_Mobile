class ProductModel {
  int id;
  String title;
  double price;
  String description;
  String image;
  double rating;
  int review;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
    required this.review,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      image: json['image'],
      rating: (json['rating']['rate'] as num).toDouble(),
      review: json['rating']['count'],
    );
  }
}