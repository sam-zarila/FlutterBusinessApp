import '../models/cart_model.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
     final List<CartModel> cartModels;
     final double total;


   CheckoutPage({
    required this.cartModels,
    required this.total,
    
    super.key});

    final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
     final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController locationController = TextEditingController();
    final TextEditingController deliveryOptionController = TextEditingController();
 
    return const Placeholder();
  }
}
