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
        'Content-Type': 'application/json',
      },
      body: json.encode(cartItem.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Item added to cart: ${response.body}');
    } else {
      throw Exception('Failed to add items to cart: ${response.body}');
    }
  }

  Future<List<CartModel>> fetchCartItems(int userId) async {
    final url = '$baseUrl/cart/$userId'; // Ensure this is the correct endpoint

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((item) => CartModel.fromJson(item))
          .toList()
          .cast<CartModel>();
    } else {
      // Handle 404 error more gracefully
      if (response.statusCode == 404) {
        print('No cart items found for user ID $userId');
        return []; // Return an empty list if no items are found
      }
      throw Exception('Failed to fetch cart items: ${response.body}');
    }
  }
}
