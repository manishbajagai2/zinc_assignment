class Product {
  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;
  final double rating;
  final int ratingCount;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    required this.rating,
    required this.ratingCount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      category: json['category'],
      description: json['description'],
      image: json['image'],
      rating: json['rating']['rate'].toDouble(),
      ratingCount: json['rating']['count'],
    );
  }
}
