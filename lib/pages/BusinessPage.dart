// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _currentIndex = 0;
//   late PageController _pageController;

//   final List<String> imgList = [
//     'assets/98.jpg',
//     'assets/kick.jpg',
//     'assets/max.jpg',
//     'assets/kick2.jpg'
//   ];

//   final List<String> categories = ['Lifestyle', 'Running', 'Tennis'];

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: _currentIndex);
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
// //
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
//             // Search bar
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[200],
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: const Row(
//                         children: [
//                           Icon(Icons.search, color: Colors.grey),
//                           SizedBox(width: 10),
//                           Expanded(
//                             child: TextField(
//                               decoration: InputDecoration(
//                                 hintText: "Search",
//                                 border: InputBorder.none,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 15),
//                   const Icon(Icons.shopping_bag_outlined, color: Colors.grey),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             // Sliding banner for "New Collection" using PageView
//             SizedBox(
//               height: 200,
//               child: PageView.builder(
//                 controller: _pageController,
//                 itemCount: imgList.length,
//                 onPageChanged: (index) {
//                   setState(() {
//                     _currentIndex = index;
//                   });
//                 },
//                 itemBuilder: (context, index) {
//                   return Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 10.0),
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage(imgList[index]),
//                         fit: BoxFit.cover,
//                       ),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: const Padding(
//                       padding: EdgeInsets.all(15.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "New Collection",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             "Nike Air Presto",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 20),
//             // Dots indicator
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: imgList.asMap().entries.map((entry) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _currentIndex = entry.key;
//                     });
//                     _pageController.animateToPage(
//                       entry.key,
//                       duration: const Duration(milliseconds: 300),
//                       curve: Curves.easeInOut,
//                     );
//                   },
//                   child: Container(
//                     width: 8.0,
//                     height: 8.0,
//                     margin: const EdgeInsets.symmetric(
//                         vertical: 10.0, horizontal: 4.0),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: _currentIndex == entry.key
//                           ? Colors.black
//                           : Colors.grey,
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//             const SizedBox(height: 20),
//             // Category section
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: categories
//                     .map((category) => Column(
//                           children: [
//                             Text(
//                               category,
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             Container(
//                               width: 60,
//                               height: 60,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey[200],
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ],
//                         ))
//                     .toList(),
//               ),
//             ),
//             const SizedBox(height: 20),
//             // Products section
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Top Deals",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   GridView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 0.75,
//                       crossAxisSpacing: 20,
//                       mainAxisSpacing: 20,
//                     ),
//                     itemCount: imgList.length,
//                     itemBuilder: (context, index) {
//                       return ProductCard(
//                         image: imgList[index % imgList.length],
//                         name: "Nike Air Max",
//                         price: "\$218",
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ProductCard extends StatelessWidget {
//   final String image;
//   final String name;
//   final String price;

//   const ProductCard({
//     Key? key,
//     required this.image,
//     required this.name,
//     required this.price,
//   }) : super(key: key);

//   void addToCart() {
//     print("Added to cart");
//   }

//   void placeOrder() {
//     print("Order placed");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 5,
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Image.asset(image, fit: BoxFit.cover),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   price,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Column(
//                   children: [
//                     ElevatedButton(
//                       onPressed: addToCart,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.orange,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: const Text("Add to Cart"),
//                     ),
//                     const SizedBox(height: 5),
//                     ElevatedButton(
//                       onPressed: placeOrder,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: const Text("Order"),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/kick3.jpg'),
              radius: 20,
            ),
            const SizedBox(width: 10),
            const Text("Hello, Sam Zarila",
                style: TextStyle(color: Colors.black)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     // Banner Section
        //     _buildBannerSection(),
        //     // Category Section
        //     _buildCategorySection(),
        //     // New Arrivals Section
        //     _buildNewArrivalsSection(),
        //     const SizedBox(height: 20),
        //   ],
        // ),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: imgList.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (contex, index) {
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
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              'Nike Air Max 98',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        
                        ),
                    );
                  }),
            ),
            const SizedBox(height: 20),
//             // Dots indicator
           Row(
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
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                     color: _currentIndex == entry.key
                         ? Colors.black
                         : Colors.grey,
                   ),
                 ),
               );
             }).toList(),
           )

          ],
        ),
      ),
    );
  }

  // Banner Section
  Widget _buildBannerSection() {
    return SizedBox(
      height: 180,
      child: PageView.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imgList[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
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
                backgroundColor: Colors.blueAccent.withOpacity(0.1),
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

  // Product Card Widget
  Widget _buildProductCard(String image, String name, String price) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(price, style: const TextStyle(color: Colors.blueAccent)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
