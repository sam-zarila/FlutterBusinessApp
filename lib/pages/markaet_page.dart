import 'package:flutter/material.dart';
import '../models/getMarket_model.dart';
import '../services/getMarkets.dart';

class MarketPlacePage extends StatefulWidget {
  const MarketPlacePage({super.key});

  @override
  State<MarketPlacePage> createState() => _MarketPlacePageState();
}

class _MarketPlacePageState extends State<MarketPlacePage> {
  final MarketService _marketService = MarketService();
  List<GetmarketModel> _marketItems = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchMarketItems();
  }

  Future<void> _fetchMarketItems() async {
    try {
      final items = await _marketService.fetchMarketItems();
      setState(() {
        _marketItems = items;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching market items: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _handleAddToCart(GetmarketModel item) {
    // Implement the logic to add the item to the cart
    print('Adding ${item.name} to the cart');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Market Place')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _marketItems.length,
              itemBuilder: (context, index) {
                final marketItem = _marketItems[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Display the image
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(marketItem.image), // Load image from URL
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Display name of the item
                        Text(
                          marketItem.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // Display provider
                        Text(
                          'Provider: ${marketItem.provider}',
                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                        ),

                        // Display location
                        Text(
                          'Location: ${marketItem.location}',
                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                        ),

                        // Display price
                        Text(
                          'Price: ${marketItem.price} MWK',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 10),

                        // Add to cart button
                        ElevatedButton(
                          onPressed: () => _handleAddToCart(marketItem),
                          child: const Text('Add to Cart'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(40),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}