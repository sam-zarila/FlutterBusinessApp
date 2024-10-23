// ignore_for_file: unused_import, use_build_context_synchronously

import 'package:business/orders/orderspage.dart';
import 'package:flutter/material.dart';
import '../models/getMarket_model.dart'; // Ensure this is the correct model for the fetched items
import '../services/getMarkets.dart';
import '../models/cart_model.dart';
import '../services/cart_service.dart';
import '../pages/markaet_page.dart';


class MarketPage extends StatelessWidget {
  final CartService cartService = CartService('http://127.0.0.1:3000');

  MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market Items'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            Text(
              'Available Items',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            MarketLists(),
          ],
        ),
      ),
    );
  }
}

class MarketLists extends StatefulWidget {
  const MarketLists({super.key});

  @override
  State<MarketLists> createState() => _MarketListsState();
}

class _MarketListsState extends State<MarketLists> {
  late Future<List<GetmarketModel>> _getMarketModelFuture;
  final MarketService _marketService = MarketService();
  final CartService _cartService = CartService('https://busines265.onrender.com');

  @override
  void initState() {
    super.initState();
    _getMarketModelFuture = _marketService.fetchMarketItems();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GetmarketModel>>(
      future: _getMarketModelFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No listings available'),
          );
        } else {
          final marketItems = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: marketItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                return ListingCard(
                  getmarketModel: marketItems[index],
                  cartService: _cartService,
                );
              },
            ),
          );
        }
      },
    );
  }
}

class ListingCard extends StatelessWidget {
  final GetmarketModel getmarketModel;
  final CartService cartService;

  const ListingCard({
    required this.getmarketModel,
    required this.cartService,
    super.key,
  });

  Future<void> addToCart(BuildContext context) async {
    try {
      final cartItem = CartModel(
        item: getmarketModel.id, // Adjust based on your model's ID field
        quantity: 1,
        image: getmarketModel.image,
        name: getmarketModel.name,
        provider: getmarketModel.provider, // Assuming there's a provider field
        price: getmarketModel.price,
        location: getmarketModel.location, // Assuming there's a location field
      );

      await cartService.addTocart(cartItem);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Item added to cart')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.network(
              getmarketModel.image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getmarketModel.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'Price: ${getmarketModel.price}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                ElevatedButton.icon(
                  onPressed: () {
                    addToCart(context);
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Add to Cart',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(30),
                    backgroundColor: Colors.green,
                  ),
                ),
                const SizedBox(height: 4),
                ElevatedButton.icon(
                  onPressed: () {
                    final double price =
                        double.tryParse(getmarketModel.price) ?? 0.0;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrdersPage(
                          itemName: getmarketModel.name,
                          price: price,
                          imageUrl: getmarketModel.image, // Passing image
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.shopping_basket,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Order Now',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(30),
                    backgroundColor: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
