import 'dart:async';
import 'package:flutter/material.dart';
import '../pages/category_dart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late PageController _pageController;
  Timer? _timer;

  String _greeting = '';
  bool _isEnglish = true;

  final List<BannerModel> banners = [
    BannerModel(
      imagePath: 'assets/Happy.jpg',
      title: 'Happy Shopping',
      description: 'Enjoy seamless shopping in our app',
    ),
    BannerModel(
      imagePath: 'assets/paychangu.jpg',
      title: 'Payments',
      description: 'Payments are secured by PayChangu',
    ),
    BannerModel(
      imagePath: 'assets/print-services.png',
      title: 'Print Services',
      description: 'High-quality printing solutions',
    ),
    BannerModel(
      imagePath: 'assets/R.png',
      title: 'Order Food',
      description: 'Delicious meals delivered to you in time',
    ),
    BannerModel(
      imagePath: 'assets/football.jpg',
      title: 'New season 2024/5 Jersey',
      description: 'order quality jersey from Jersey Centre',
    ),
    BannerModel(
      imagePath: 'assets/OIP.jpg',
      title: 'Uber & Taxi Services',
      description: 'Call taxi and Uber anytime, available 24/7',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    _startAutoSlide();
    _updateGreeting();
    _startGreetingTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _updateGreeting() {
    final hour = DateTime.now().hour;
    String greetingMessage;

    if (hour < 12) {
      greetingMessage = _isEnglish
          ? "Good morning! What are you buying today?"
          : "Mwadzuka bwanji Akasi! Mutigula chani lero?";
    } else if (hour < 17) {
      greetingMessage = _isEnglish
          ? "Good afternoon! How about buying something?"
          : "Mwaswera bwanji Akasi! Kodi mwatigulako lero?";
    } else {
      greetingMessage = _isEnglish
          ? "Good evening! Close the day with a purchase!"
          : "Madzulo abwino!mudya chani Madzulo ano? ";
    }

    setState(() {
      _greeting = greetingMessage;
    });
  }

  void _startGreetingTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      setState(() {
        _isEnglish = !_isEnglish;
      });
      _updateGreeting();
    });
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentIndex < banners.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }

      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/B.jpg'),
              radius: 20,
            ),
            SizedBox(width: 10),
            Text(
              "Business Hub",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
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
            _buildPromotionalBanner(),
            _buildDotsIndicator(),
            _buildCategorySection(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                child: Text(
                  _greeting,
                  key: ValueKey<String>(_greeting),
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            _buildProductCardsSection(),
            const SizedBox(height: 20),
            _buildMobileMoneySection(),
            // CategorySection()

          ],
        ),
      ),
    );
  }

  Widget _buildPromotionalBanner() {
    return SizedBox(
      height: 180,
      child: PageView.builder(
        controller: _pageController,
        itemCount: banners.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(banners[index].imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      banners[index].title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      banners[index].description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
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
      children: banners.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () {
            _pageController.animateToPage(
              entry.key,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            setState(() {
              _currentIndex = entry.key;
            });
          },
          child: Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  _currentIndex == entry.key ? Colors.green : Colors.grey[300],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCategorySection() {
    final categories = [
      "Reliable",
      "Trustworthy",
      "Fast Shipping",
      "Affordable"
    ];

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

  Widget _buildProductCardsSection() {
    final products = [
      {'image': 'assets/chips.jpg', 'name': 'chips', 'price': 'K2,500'},
      {'image': 'assets/food.jpg', 'name': ' chakudya', 'price': 'K15,000'},
      {'image': 'assets/rice.jpg', 'name': 'Product 3', 'price': 'K12,000'},
      {'image': 'assets/nsima.jpg', 'name': 'Product 4', 'price': 'K8,000'},
    ];

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProductCard(products[0]['image']!, products[0]['name']!,
                  products[0]['price']!),
              _buildProductCard(products[1]['image']!, products[1]['name']!,
                  products[1]['price']!),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProductCard(products[2]['image']!, products[2]['name']!,
                  products[2]['price']!),
              _buildProductCard(products[3]['image']!, products[3]['name']!,
                  products[3]['price']!),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(String image, String name, String price) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image, fit: BoxFit.cover, height: 120, width: 120),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Text(price, style: const TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileMoneySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Text(
            'Our Super App Services',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              _buildMobileMoneyCard('Airtel Money', 'assets/airtel_logo.png'),
              _buildMobileMoneyCard('TNM Mpamba', 'assets/mpamba_logo.png'),
              _buildMobileMoneyCard('MO626', 'assets/MO626.png'),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildMobileMoneyCard(String serviceName, String imagePath) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Image.asset(imagePath, fit: BoxFit.cover, height: 70, width: 70),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(serviceName,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSpecialOffersSection() {
  final specialOffers = [
    {'image': 'assets/offer1.jpg', 'description': 'Discount on Groceries'},
    {'image': 'assets/offer2.jpg', 'description': '50% Off on Electronics'},
    {'image': 'assets/offer3.jpg', 'description': 'Buy 1 Get 1 Free'},
  ];

  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Special Offers',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: specialOffers.length,
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(specialOffers[index]['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      specialOffers[index]['description']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

class BannerModel {
  final String imagePath;
  final String title;
  final String description;

  BannerModel(
      {required this.imagePath,
      required this.title,
      required this.description});
}
