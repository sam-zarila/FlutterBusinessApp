class CartModel {
  final int item;
  final int quantity;
  final String image;
  final String name;
  final String provider;
  final String price;
  final String location;

  CartModel(
      {required this.item,
      required this.quantity,
      required this.image,
      required this.name,
      required this.provider,
      required this.price,
      required this.location});
  Map<String, dynamic> toJson() {
    return {
      'item': item,
      'quantinty': quantity,
      'image': image,
      'provider': provider,
      'price': price,
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
        price: json['price'],
        location: json['location']);
  }
}
