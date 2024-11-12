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
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16), 
          itemBuilder:(context, index){
            final shoe = shoes[index];

          }),
        ),
    );
  }
}
class CategoryCard extends StatelessWidget {

  final Shoe shoe;
  const CategoryCard({
    required this.shoe,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10),),

                 child: Image.asset(
                shoe.imageUrl,
                fit: BoxFit.cover,
            )
            )
            
           
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            
            child: Text(
              shoe.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                '${shoe.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 14),)),

                
        ],
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
