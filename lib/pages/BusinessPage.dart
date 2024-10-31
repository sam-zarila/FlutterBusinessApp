import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late PageController _pageController;
  late Timer _timer;

  final List<String> imgList = [
    'assets/98.jpg',
    'assets/kick.jpg',
    'assets/max.jpg',
    'assets/kick2.jpg'
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_pageController.hasClients) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % imgList.length;
          _pageController.animateToPage(
            _currentIndex,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel(); // Stop the timer when disposing the page
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/kick3.jpg'),
              radius: 20,
            ),
            const SizedBox(width: 10),
            const Text("Busines is Busines",
                style: TextStyle(color: Colors.white)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Section with Auto Slide
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: imgList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imgList[index]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New Arrivals',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Nike Air Max 98',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            _buildCategorySection(),
            _buildNewArrivalsSection(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Category Section
  Widget _buildCategorySection() {
    final categories = ["Essentials", "Delivery", "Top Picks", "Trending"];

    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 20),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Chip(
                label: Text(categories[index]),
                backgroundColor: Colors.orange.withOpacity(0.2),
              ),
            );
          },
        ),
      ),
    );
  }

  // New Arrivals Section
  Widget _buildNewArrivalsSection() {
    final products = [
      {"image": "assets/98.jpg", "name": "Product 1", "price": "\$30"},
      {"image": "assets/kick.jpg", "name": "Product 2", "price": "\$50"},
    ];

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("New Arrival",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return _buildProductCard(
                products[index]["image"]!,
                products[index]["name"]!,
                products[index]["price"]!,
              );
            },
          ),
        ],
      ),
    );
  }

  // Product Card Widget with Popup Buttons
  // Product Card Widget with Popup Buttons
  Widget _buildProductCard(String image, String name, String price) {
    return Card(
      color: Colors.green[50],
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Expanded image section to fill the entire width
          AspectRatio(
            aspectRatio: 1.0, // Adjust the aspect ratio as desired
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover, // Ensures the image covers the entire width
                width: double.infinity, // Forces image to fill the card width
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green)),
                const SizedBox(height: 5),
                Text(price,
                    style: const TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.center,
                  child: PopupMenuButton(
                    icon: const Icon(Icons.add_circle, color: Colors.green),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          child: const Text("Buy Now"),
                        ),
                      ),
                      PopupMenuItem(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange),
                          child: const Text("Add to Cart"),
                        ),
                      ),
                    ],
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
