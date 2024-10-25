class CartModel {
  final int item;
  final int quantity;
  final String image;
  final String name;
  final String provider;
  final double price; // Change from String to double
  final String location;

  CartModel({
    required this.item,
    required this.quantity,
    required this.image,
    required this.name,
    required this.provider,
    required this.price, // Adjusted type here
    required this.location,
  });

  Map<String, dynamic> toJson() {
    return {
      'item': item,
      'quantity': quantity,
      'image': image,
      'name': name,
      'provider': provider,
      'price': price, // Now it's a double
      'location': location,
    };
  }

  static CartModel fromJson(Map<String, dynamic> json) {
    return CartModel(
      item: json['item'],
      quantity: json['quantity'],
      image: json['image'],
      name: json['name'],
      provider: json['provider'],
      price: (json['price'] is String) 
          ? double.tryParse(json['price']) ?? 0.0 // Safely parse if it's still a string
          : json['price']?.toDouble() ?? 0.0, // Assume it's a number if not a string
      location: json['location'],
    );
  }
}
