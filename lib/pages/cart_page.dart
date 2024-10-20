import '../models/cart_model.dart';
import '../services/cart_service.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final CartService cartService;

  const CartPage({ required this.cartService,  super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('My Cart',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.orange
          ),
        ),
        centerTitle: true,

       ),
       body: FutureBuilder<CartModel>>(
        
        future: future,
        builder: builder),
    );
  }
}
