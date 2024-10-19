import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/getMarket_model.dart';

class MarketService {
  final String baseUrl = 'http://127.0.0.1:3000/marketlisting';

  Future<List<GetmarketModel>> fetchMarketItems() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((item) => GetmarketModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load market items');
      }
    } catch (e) {
      print('Error fetching market items: $e');
      return [];
    }
  }
}

