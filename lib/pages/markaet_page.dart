import 'package:business/services/getMarkets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/getMarket_model.dart';
import '../models/cart_model.dart';
import '../services/cart_service.dart';

import '../pages/cart_page.dart';

class MarketPage extends StatelessWidget {
  final CartService cartService = CartService('http://10.0.2.2:3000'); // Update to your actual cart service endpoint

  MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Market Items',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const SizedBox(
              height: 40,
              width: 40,
              child: Icon(
                Icons.shopping_cart,
                size: 40,
                color: Colors.green,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartService: cartService, userId: 1,),
                ),
              );
            },
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
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
  late Future<List<GetmarketModel>> _marketItemsFuture;
  final MarketService _marketService = MarketService();
  final CartService _cartService = CartService('http://10.0.2.2:3000'); // Update to your actual cart service endpoint

  @override
  void initState() {
    super.initState();
    _marketItemsFuture = _marketService.fetchMarketItems();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GetmarketModel>>(
      future: _marketItemsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No market items available'),
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
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                return ListingCard(
                  item: marketItems[index],
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
  final GetmarketModel item;
  final CartService cartService;

  const ListingCard({
    required this.item,
    required this.cartService,
    super.key,
  });

  Future<void> addToCart(BuildContext context) async {
    try {
      final cartItem = CartModel(
        item: item.id, // Using item ID
        quantity: 1, // Default quantity
        image: item.image,
        name: item.name,
        provider: item.provider,
        price: item.price,
        location: item.location,
      );

      await cartService.addTocart(cartItem); // Implement addToCart method in CartService
      
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
              item.image,
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
                  item.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  'Price: MWK ${item.price}', // Adjust currency formatting
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                ElevatedButton.icon(
                  onPressed: () {
                    addToCart(context); // Call the addToCart method
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
