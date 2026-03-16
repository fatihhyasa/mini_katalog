class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  // JSON verisini alıp Dart nesnesine çeviren (fromJson) metodumuz
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(), // Fiyatı ondalıklı sayıya garantiliyoruz
      imageUrl: json['imageUrl'],
    );
  }
}