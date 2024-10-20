

import 'package:flutter/material.dart';
import '../models/getMarket_model.dart'; // Ensure this is the correct model for the fetched items
import '../services/getMarkets.dart';

// class MarketPage extends StatelessWidget {
//   final MarketService marketService = MarketService();

//   MarketPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Market Items'),
//       ),
//       body: const SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 16),
//             Text(
//               'Available Items',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             MarketLists(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MarketLists extends StatefulWidget {
//   const MarketLists({super.key});

//   @override
//   State<MarketLists> createState() => _MarketListsState();
// }

// class _MarketListsState extends State<MarketLists> {
//   late Future<List<GetmarketModel>> _marketFuture;

//   @override
//   void initState() {
//     super.initState();
//     _marketFuture = MarketService().fetchMarketItems();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<GetmarketModel>>(
//       future: _marketFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text('No items available'));
//         } else {
//           final marketItems = snapshot.data!;

//           return Padding(
//             padding: const EdgeInsets.all(10),
//             child: GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: marketItems.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 childAspectRatio: 0.65,
//               ),
//               itemBuilder: (context, index) {
//                 return MarketItemCard(marketItem: marketItems[index]);
//               },
//             ),
//           );
//         }
//       },
//     );
//   }
// }

// class MarketItemCard extends StatelessWidget {
//   final GetmarketModel marketItem;

//   const MarketItemCard({required this.marketItem, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       elevation: 3,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(10),
//               topRight: Radius.circular(10),
//             ),
//             child: Image.network(
//               marketItem.image,
//               height: 120,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   marketItem.name,
//                   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   'Price: ${marketItem.price}',
//                   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}