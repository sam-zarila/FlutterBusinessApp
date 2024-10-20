import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/cart_model.dart';

class CartService {
  final String baseUrl;

  CartService(this.baseUrl);

  Future<void> addTocart(CartModel cartItem) async {
    final url = '$baseUrl/cart';

    final response = await http.post(
      Uri.parse(url),

      headers: {
        'content-Type':'application/json',       
      },
      body: json.encode(cartItem.toJson),
    );

    
  }
}
