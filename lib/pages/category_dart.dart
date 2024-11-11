import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  final List<Shoe> shoes = [
    Shoe(name: "", price: 20000, imageUrl: '' ),
     Shoe(name: "", price: 20000, imageUrl: '' ),
    Shoe(name: "", price: 20000, imageUrl: '' ),
    Shoe(name: "", price: 20000, imageUrl: '' ),
    ];

  CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: shoes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2), 
          itemBuilder: itemBuilder),
        ),
    );
  }
}

class Shoe {
  final String name;
  final double price;
  final String imageUrl;

  Shoe({required this.name, required this.price, required this.imageUrl});
}
