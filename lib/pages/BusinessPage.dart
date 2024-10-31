import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

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
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
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
            const Text("Business Hub",
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            _buildPromotionalBanner(),
            _buildDotsIndicator(),
            _buildCategorySection(),
            _buildPopularProductsSection(),
            _buildNewArrivalsSection(),
            _buildLayByeSection(), // Lay-Bye section added here
            _buildServicesSection(), // Services section added here
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search products...',
          prefixIcon: const Icon(Icons.search, color: Colors.green),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildPromotionalBanner() {
    return SizedBox(
      height: 180,
      child: PageView.builder(
        controller: _pageController,
        itemCount: imgList.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
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
                    'Special Offers',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Explore the latest deals',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDotsIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imgList.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _currentIndex = entry.key;
            });
            _pageController.animateToPage(
              entry.key,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          child: Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndex == entry.key
                  ? Colors.green
                  : Colors.grey[300],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCategorySection() {
    final categories = ["Essentials", "Electronics", "Fashion", "Home"];

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
                backgroundColor: Colors.orangeAccent.withOpacity(0.2),
              ),
            );
          },
        ),
      ),
    );
  }

  // Popular Products Section
  Widget _buildPopularProductsSection() {
    final popularProducts = [
      {"name": "Product 1", "image": "assets/98.jpg", "price": "\$99"},
      {"name": "Product 2", "image": "assets/kick.jpg", "price": "\$79"},
      {"name": "Product 3", "image": "assets/max.jpg", "price": "\$89"},
    ];

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Popular Products",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularProducts.length,
              itemBuilder: (context, index) {
                return _buildProductCard(
                  popularProducts[index]["name"] as String,
                  popularProducts[index]["image"] as String,
                  popularProducts[index]["price"] as String,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(String name, String image, String price) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(image, fit: BoxFit.cover, height: 120),
          ),
          const SizedBox(height: 5),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(price, style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }

  // New Arrivals Section
  Widget _buildNewArrivalsSection() {
    final newArrivals = [
      {"name": "New Arrival 1", "image": "assets/kick2.jpg", "price": "\$120"},
      {"name": "New Arrival 2", "image": "assets/max.jpg", "price": "\$140"},
    ];

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("New Arrivals",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: newArrivals.length,
              itemBuilder: (context, index) {
                return _buildProductCard(
                  newArrivals[index]["name"] as String,
                  newArrivals[index]["image"] as String,
                  newArrivals[index]["price"] as String,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Lay-Bye Section
  Widget _buildLayByeSection() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Lay-Bye Options",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(
            "Buy now, pay later with flexible payment plans.",
            style: TextStyle(color: Colors.grey[700]),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildLayByeItem("Air Max 98", "assets/98.jpg", "\$120"),
              _buildLayByeItem("Air Jordan", "assets/kick.jpg", "\$140"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLayByeItem(String name, String image, String price) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(image, fit: BoxFit.cover, height: 80),
          ),
          const SizedBox(height: 5),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(price, style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }

  // Services Section
  Widget _buildServicesSection() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Our Services",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(
            "We offer various services including:",
            style: TextStyle(color: Colors.grey[700]),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              _buildServiceItem("Home Delivery"),
              _buildServiceItem("Gift Wrapping"),
              _buildServiceItem("Customer Support"),
              _buildServiceItem("Easy Returns"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem(String serviceName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green),
          const SizedBox(width: 10),
          Text(serviceName),
        ],
      ),
    );
  }
}
