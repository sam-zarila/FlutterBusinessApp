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
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two cards per row
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.6, // Adjust to fit the card design
                ),
                itemCount: _marketItems.length,
                itemBuilder: (context, index) {
                  final marketItem = _marketItems[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Display the image with rounded corners
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.network(
                            marketItem.image,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              // Display name of the item
                              Text(
                                marketItem.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),

                              // Display provider
                              Text(
                                'Provider: ${marketItem.provider}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 4),

                              // Display location
                              Text(
                                'Location: ${marketItem.location}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 4),

                              // Display price
                              Text(
                                'Price: ${marketItem.price} MWK',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),

                              // Add to cart button
                              ElevatedButton.icon(
                                onPressed: () => _handleAddToCart(marketItem),
                                icon: const Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                ),
                                label: const Text('Add to Cart'),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(40),
                                  backgroundColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
