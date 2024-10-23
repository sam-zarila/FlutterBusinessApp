// ignore_for_file: file_names, unnecessary_string_interpolations, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/markret_model.dart';

class MarketService {
  final String baseUrl = 'https://busines265.onrender.com/marketlisting';

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
