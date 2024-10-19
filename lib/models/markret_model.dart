class MarkretModel {
  final String image;
  final String name;
  final String provider;
  final String price;
  final String location;

  MarkretModel(
      {required this.image,
      required this.name,
      required this.provider,
      required this.price,
      required this.location});

  Map<String, dynamic> toJson() {
    return {
     'image':image,
     'name':name,
     'provider':provider,
     'price':price,
     'location':location,

    };
  }
}
