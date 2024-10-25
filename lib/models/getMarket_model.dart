// ignore_for_file: file_names

class GetmarketModel {
  final int id;
  final String image;
  final String name;
  final String provider;
  final double price;
  final String location;

  GetmarketModel({
    required this.id,
    required this.image,
    required this.name,
    required this.provider,
    required this.price,
    required this.location,
  });

  factory GetmarketModel.fromJson(Map<String, dynamic> json) {
    return GetmarketModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      provider: json['provider'],
      price: json['price'],
      location: json['location'],
    );
  }
   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'provider': provider,
      'price': price,
      'location': location,
    };
  }
}
