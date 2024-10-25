import '../models/cart_model.dart';
import '../services/cart_service.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final CartService cartService;
  final int userId; // Add userId to the class

  const CartPage({required this.cartService, required this.userId, super.key}); // Add userId to constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<CartModel>>(
        future: cartService.fetchCartItems(userId), // Pass userId to fetchCartItems
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Your cart is empty'));
          } else {
            final cartItems = snapshot.data!;

            double total = 0.0;
            for (var item in cartItems) {
              total += double.parse(
                      item.price.replaceAll(RegExp(r'[^0-9.]'), '')) *
                  item.quantity;
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartItems[index];
                      final itemTotal = double.parse(
                              cartItem.price.replaceAll(RegExp(r'[^0-9.]'), '')) *
                          cartItem.quantity;

                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 10.0),
                        child: ListTile(
                          leading: Image.network(
                            cartItem.image,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(cartItem.name),
                          subtitle: Text(
                              'Quantity: ${cartItem.quantity}\nPrice: ${cartItem.price}'),
                          trailing: Text(
                              'Total: MWK ${itemTotal.toStringAsFixed(2)}'),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total: MWK ${total.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          // Implement your checkout logic here
                        },
                        child: const Text('Checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
