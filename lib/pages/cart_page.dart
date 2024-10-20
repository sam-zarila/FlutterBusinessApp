import '../models/cart_model.dart';
import '../services/cart_service.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final CartService cartService;

  const CartPage({required this.cartService, super.key});

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
          future: cartService.fetchCartItems(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error:${snapshot.error}'),
              );
            } else if(!snapshot.hasData || snapshot.data!.isEmpty ){

            }
          }),
    );
  }
}
