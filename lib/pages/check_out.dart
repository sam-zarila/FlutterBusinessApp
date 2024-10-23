import '../models/cart_model.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
     final List<CartModel> cartModels;
     final double total;


  const CheckoutPage({
    required this.cartModels,
    required this.total,
    
    super.key});

  @override
  Widget build(BuildContext context) {
 
    return const Placeholder();
  }
}
