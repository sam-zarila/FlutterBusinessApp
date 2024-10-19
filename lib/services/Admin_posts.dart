import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/markret_model.dart';

class MarketService {
  final String baseUrl = 'http://127.0.0.1:3000/marketlisting';

  Future<bool> createMarketItem(MarkretModel marketItem) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(marketItem.toJson() ),
      );

      return response.statusCode == 201;
    } catch (e) {
      print('Error posting market item: $e');
      return false;
    }
  }
}
