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
          future: cartService.fetchCartModel(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error:${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('your cart empty'));
            } else {
              final CartModel = snapshot.data!;

              double total = 0.0;
              for( var item in CartModel){
                 total += double.parse(item.price.replaceAll(RegExp(r'[^0-9.]'), '')) * item.quantity;

              }
              return Column(
                children: [
                  Expanded(
                    child:ListView.builder(
                      itemBuilder:(context, index){
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                          child: ListTile(
                             leading: Image.network(CartModel[index].image, width: 50, height: 50, fit: BoxFit.cover),
                              title: Text(CartModel[index].name), // Display name
                          subtitle: Text('Quantity: ${CartModel[index].quantity}\nPrice: ${CartModel[index].price}'), // Display quantity and price
                          trailing: Text('Total: \$${(double.parse(CartModel[index].price.replaceAll(RegExp(r'[^0-9.]'), '')) * CartModel[index].quantity).toStringAsFixed(2)}'),

                          ),

                        );
                      }) )
                ],
              )
            }
          }),
    );
  }
}
