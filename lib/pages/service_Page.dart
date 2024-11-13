// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_element



// class ServicePage extends StatelessWidget {
//   const ServicePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Welcome to the Shop'),
//         backgroundColor: Colors.black, // Set AppBar color to black
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),

//         // Wrap with SingleChildScrollView to make the content scrollable
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // PHARMACY and SHOP Row (First Row)
//               Row(
//                 children: [
//                   Expanded(
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const PharmacyScreen(),
//                           ),
//                         );
//                       },
//                       child: _buildSummaryCard(
//                         title: 'PHARMACY',
//                         icon: Icons.medical_information,
//                         subtitle: 'PILLS',
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 16.0),
//                   Expanded(
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const ShopScreen(),
//                           ),
//                         );
//                       },
//                       child: _buildSummaryCard(
//                         title: 'DRINK SHOP',
//                         icon: Icons.shop,
//                         subtitle: 'SOFT DRINKS OR LIQUOR',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 32.0),

//               // UBER DRIVER and SERVICES Row (Second Row)
//               Row(
//                 children: [
//                   Expanded(
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const UberDriverScreen(
//                               driverName: '',
//                             ),
//                           ),
//                         );
//                       },
//                       child: _buildSummaryCard(
//                         title: 'TAXI DRIVER',
//                         icon: Icons.drive_eta,
//                         subtitle: 'Reliable rides with professional drivers.',
//                         additionalInfo: 'Available 24/7 in your area.',
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 16.0),
//                   Expanded(
//                     child: InkWell(
//                       onTap: () {
//                         // Perform any actions when services are tapped
//                       },
//                       child: _buildSummaryCard(
//                         title: 'DIGITAL SERVICES',
//                         icon: Icons.miscellaneous_services,
//                         subtitle: 'Printing and Mobile Money',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 32.0),

//               // AGNESS MANYOWA Row (Third Row)
//               Row(
//                 children: [
//                   Expanded(
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const AgnessManyowaScreen(),
//                           ),
//                         );
//                       },
//                       child: _buildSummaryCard(
//                         title: 'AGNESS MANYOWA',
//                         icon: Icons.grass,
//                         subtitle: '420',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 32.0),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Method to build the summary card with Apple design
//   Widget _buildSummaryCard({
//     required String title,
//     required IconData icon,
//     required String subtitle,
//     String? additionalInfo,
//   }) {
//     return Card(
//       color: Colors.black, // Card background color
//       elevation: 4, // Shadow for elevation effect
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16.0), // Rounded corners
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Icon(
//               icon,
//               size: 60.0,
//               color: Colors.blue, // Icon color
//             ),
//             const SizedBox(height: 8.0),
//             Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 4.0),
//             Text(
//               subtitle,
//               style: const TextStyle(
//                 color: Colors.white70,
//                 fontSize: 14.0,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             if (additionalInfo != null) ...[
//               const SizedBox(height: 4.0),
//               Text(
//                 additionalInfo,
//                 style: const TextStyle(
//                   color: Colors.white70,
//                   fontSize: 12.0,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }


// class PharmacyScreen extends StatelessWidget {
//   const PharmacyScreen({super.key});

//   // Helper function to build each medicine card with price and buy button
//   Widget buildMedicineCard(BuildContext context, String title, String type,
//       IconData icon, String price) {
//     return Expanded(
//       child: SummaryCard(
//         title: title,
//         content: Column(
//           children: [
//             Icon(icon, size: 60.0, color: Colors.white),
//             Text(
//               type,
//               style: const TextStyle(color: Colors.white),
//             ),
//             const SizedBox(height: 8.0),
//             Text(
//               'MWK $price', // Displaying the price in Malawian Kwacha
//               style: const TextStyle(
//                 color: Colors.green,
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to PurchaseMedicineScreen with the medicine name
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         PurchaseMedicineScreen(medicineName: title),
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//               ),
//               child: const Text('Buy'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Welcome to Pharmacy'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // Row for medicines with price and buy button
//               Row(
//                 children: [
//                   buildMedicineCard(context, 'Medicine 1', 'Painkillers',
//                       Icons.medication, '500'),
//                   const SizedBox(width: 16.0),
//                   buildMedicineCard(context, 'Medicine 2', 'Antibiotics',
//                       Icons.medication_liquid, '1200'),
//                 ],
//               ),
//               const SizedBox(height: 16.0),
//               Row(
//                 children: [
//                   buildMedicineCard(context, 'Medicine 3', 'Insulin',
//                       Icons.local_hospital, '2500'),
//                 ],
//               ),
//               const SizedBox(height: 32.0),

//               // Go back button
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                 ),
//                 child: const Text('Go Back'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SummaryCard extends StatelessWidget {
//   final String title;
//   final Widget content;

//   const SummaryCard({
//     super.key,
//     required this.title,
//     required this.content,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.black,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8.0),
//             content,
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ShopScreen extends StatelessWidget {
//   const ShopScreen({super.key});

//   // Helper function to build each drink card with price
//   Widget buildDrinkCard(
//       BuildContext context, String title, IconData icon, String price) {
//     return Expanded(
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         elevation: 5,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Icon(icon, size: 60.0, color: Colors.grey[800]),
//               const SizedBox(height: 8.0),
//               Text(
//                 title,
//                 style: const TextStyle(
//                     color: Colors.black, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8.0),
//               Text(
//                 'MWK $price', // Displaying the price with Malawian kwacha
//                 style: const TextStyle(
//                   color: Colors.green,
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8.0),
//               ElevatedButton(
//                 onPressed: () {
//                   // Navigate to PurchaseDrinkScreen with the name of the drink
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           PurchaseDrinkScreen(drinkName: title),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                 ),
//                 child: const Text('Buy'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Helper function to build filter chip
//   Widget buildFilterChip(String label) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 4.0),
//       child: ChoiceChip(
//         label: Text(label),
//         selected: false, // Add logic for selection state
//         onSelected: (bool selected) {
//           // Handle filter selection here
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text(
//           'Welcome to the Shop - Perfect Choice',
//           style: TextStyle(color: Colors.black),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.filter_list, color: Colors.black),
//             onPressed: () {
//               // Handle filter action
//             },
//           ),
//         ],
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // Search Bar
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: "Search",
//                   prefixIcon: const Icon(Icons.search),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16.0),

//               // Category Filters
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   buildFilterChip('All'),
//                   buildFilterChip('Soft Drinks'),
//                   buildFilterChip('Liquor'),
//                   buildFilterChip('Ciders'),
//                 ],
//               ),
//               const SizedBox(height: 16.0),

//               const Text(
//                 'Soft Drinks',
//                 style: TextStyle(
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.green,
//                 ),
//               ),
//               const SizedBox(height: 16.0),

//               // Row for soft drinks with price
//               Row(
//                 children: [
//                   buildDrinkCard(
//                       context, 'Coca Cola', Icons.local_cafe, '1500'),
//                   const SizedBox(width: 16.0),
//                   buildDrinkCard(context, 'Pepsi', Icons.local_drink, '1200'),
//                 ],
//               ),
//               const SizedBox(height: 16.0),
//               Row(
//                 children: [
//                   buildDrinkCard(context, 'Fanta', Icons.sports_bar, '1300'),
//                   const SizedBox(width: 16.0),
//                   buildDrinkCard(context, 'Sprite', Icons.bubble_chart, '1250'),
//                 ],
//               ),
//               const SizedBox(height: 32.0),

//               const Text(
//                 'Liquor',
//                 style: TextStyle(
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.green,
//                 ),
//               ),
//               const SizedBox(height: 16.0),

//               // Row for liquors with price
//               Row(
//                 children: [
//                   buildDrinkCard(context, 'Whiskey', Icons.local_bar, '15000'),
//                   const SizedBox(width: 16.0),
//                   buildDrinkCard(context, 'Vodka', Icons.wine_bar, '12500'),
//                 ],
//               ),
//               const SizedBox(height: 16.0),
//               Row(
//                 children: [
//                   buildDrinkCard(context, 'Rum', Icons.nightlife, '13000'),
//                   const SizedBox(width: 16.0),
//                   buildDrinkCard(
//                       context, 'Gin', Icons.emoji_food_beverage, '14000'),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class UberDriverScreen extends StatelessWidget {
//   const UberDriverScreen({super.key, required String driverName});

//   @override
//   Widget build(BuildContext context) {
//     // Sample driver profiles data with image URLs
//     final List<Map<String, String>> drivers = [
//       {
//         'name': 'Alice',
//         'rating': '4.8',
//         'car': 'Toyota Camry',
//         'image': 'https://via.placeholder.com/150'
//       },
//       {
//         'name': 'Bob',
//         'rating': '4.6',
//         'car': 'Honda Civic',
//         'image': 'https://via.placeholder.com/150'
//       },
//       {
//         'name': 'Charlie',
//         'rating': '5.0',
//         'car': 'Ford Focus',
//         'image': 'https://via.placeholder.com/150'
//       },
//       {
//         'name': 'David',
//         'rating': '4.7',
//         'car': 'Nissan Altima',
//         'image': 'https://via.placeholder.com/150'
//       },
//       {
//         'name': 'Eva',
//         'rating': '4.9',
//         'car': 'Chevrolet Malibu',
//         'image': 'https://via.placeholder.com/150'
//       },
//       {
//         'name': 'Frank',
//         'rating': '4.5',
//         'car': 'Hyundai Elantra',
//         'image': 'https://via.placeholder.com/150'
//       },
//       {
//         'name': 'Grace',
//         'rating': '4.8',
//         'car': 'Kia Optima',
//         'image': 'https://via.placeholder.com/150'
//       },
//       {
//         'name': 'Hannah',
//         'rating': '4.7',
//         'car': 'Subaru Legacy',
//         'image': 'https://via.placeholder.com/150'
//       },
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Uber Drivers'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView.builder(
//           itemCount: drivers.length,
//           itemBuilder: (context, index) {
//             final driver = drivers[index];
//             return Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               elevation: 5,
//               margin: const EdgeInsets.symmetric(vertical: 8.0),
//               child: ListTile(
//                 leading: ClipOval(
//                   child: Image.network(
//                     driver['image']!,
//                     width: 60.0,
//                     height: 60.0,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 title: Text(
//                   driver['name']!,
//                   style: const TextStyle(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 subtitle:
//                     Text('${driver['car']} - Rating: ${driver['rating']}'),
//                 trailing: ElevatedButton(
//                   onPressed: () {
//                     // Navigate to BookingScreen when Book is pressed
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             UberDriverScreen(driverName: driver['name']!),
//                       ),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                   ),
//                   child: const Text('Book'),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
// class AgnessManyowaScreen extends StatelessWidget {
//   const AgnessManyowaScreen({super.key});

//   // Helper function to build each weed card with price
//   Widget buildWeedCard(BuildContext context, String title, IconData icon, String price) {
//     return Expanded(
//       child: SummaryCard(
//         title: title,
//         content: Column(
//           children: [
//             Icon(icon, size: 60.0, color: Colors.white),
//             Text(
//               title,
//               style: const TextStyle(color: Colors.white),
//             ),
//             const SizedBox(height: 8.0),
//             Text(
//               'MWK $price',  // Displaying the price with the MWK symbol
//               style: const TextStyle(
//                 color: Colors.green,
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to PurchaseDrinkScreen with the name of the weed
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => PurchaseDrinkScreen(drinkName: title),
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//               ),
//               child: const Text('Buy'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Agness Manyowa'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const Text(
//                 'Weed Types',
//                 style: TextStyle(
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.green,
//                 ),
//               ),
//               const SizedBox(height: 16.0),

//               // Row for weed types with price
//               Row(
//                 children: [
//                   buildWeedCard(context, 'Sativa', Icons.grass, '2000'), // Example price in MWK
//                   const SizedBox(width: 16.0),
//                   buildWeedCard(context, 'Indica', Icons.grass, '2500'),
//                 ],
//               ),
//               const SizedBox(height: 16.0),
//               Row(
//                 children: [
//                   buildWeedCard(context, 'Hybrid', Icons.grass, '2300'),
//                   const SizedBox(width: 16.0),
//                   buildWeedCard(context, 'Edibles', Icons.cake, '3000'),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class PurchaseMedicineScreen extends StatelessWidget {
//   final String medicineName;

//   const PurchaseMedicineScreen({super.key, required this.medicineName});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Purchase $medicineName'),
//       ),
//       body: Center(
//         child: Text(
//           'You are about to purchase $medicineName.',
//           style: const TextStyle(fontSize: 24.0),
//         ),
//       ),
//     );
//   }
// }
// class PurchaseDrinkScreen extends StatelessWidget {
//   final String drinkName;

//   const PurchaseDrinkScreen({super.key, required this.drinkName});

//   Future<void> _confirmPurchase(BuildContext context) async {
//     // Show a confirmation dialog
//     final confirmed = await showDialog<bool>(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//           title: const Text('Confirm Purchase'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('Are you sure you want to buy $drinkName?'),
//               const SizedBox(height: 16.0),
//               const Icon(
//                 Icons.local_drink,
//                 size: 80.0,
//                 color: Colors.green,
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(false), // Dismiss dialog
//               child: const Text(
//                 'Cancel',
//                 style: TextStyle(color: Colors.red),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () => Navigator.of(context).pop(true), // Confirm purchase
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//               ),
//               child: const Text('Confirm'),
//             ),
//           ],
//         );
//       },
//     );

//     // If confirmed, proceed to PaymentScreen
//     if (confirmed == true) {
//       if (context.mounted) {
//         // Generate a unique transaction reference
//         String transactionReference = '${DateTime.now().millisecondsSinceEpoch}';

//         // Navigate to PaymentScreen
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => PayChanguPaymentScreen(
//               transactionReference: transactionReference,
//               amount: 1000.0, htmlContent: '', // Set the amount as needed
//             ),
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Purchase $drinkName'),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 1.0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Do you want to buy $drinkName?',
//               style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 32.0),
//             ElevatedButton(
//               onPressed: () => _confirmPurchase(context),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//               ),
//               child: const Text(
//                 'Confirm Purchase',
//                 style: TextStyle(fontSize: 18.0),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class PayChanguPaymentScreen extends StatefulWidget {
//   const PayChanguPaymentScreen({super.key, required String transactionReference, required double amount, required String htmlContent});

//   @override
//   // ignore: library_private_types_in_public_api
//   _PayChanguPaymentScreenState createState() => _PayChanguPaymentScreenState();
// }

// class _PayChanguPaymentScreenState extends State<PayChanguPaymentScreen> {
//   late WebViewController _webViewController;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('PayChangu Payment'),
//       ),
//       body: WebView(
//         initialUrl: '',
//         javascriptMode: JavascriptMode.unrestricted,
//         onWebViewCreated: (WebViewController webViewController) {
//           _webViewController = webViewController;
//           _loadPaymentForm();
//         },
//         onPageFinished: (String url) {
//           if (url.contains("callbackurl")) {
//             _handlePaymentSuccess();
//           } else if (url.contains("error")) {
//             _handlePaymentError();
//           }
//         },
//       ),
//     );
//   }

//   // Function to load PayChangu inline JavaScript with payment details
//   void _loadPaymentForm() {
//     // Unique transaction reference
//     String txRef = Random().nextInt(1000000000).toString();

//     // Your PayChangu public key
//     String publicKey = "PUB-TEST-6NgTomdEX0j53PdWatL1EZtdIxS9eusS";
    
//     String htmlContent = '''
//       <html>
//         <body>
//           <script src="https://in.paychangu.com/js/popup.js"></script>
//           <div id="wrapper"></div>
//           <script type="text/javascript">
//             function makePayment() {
//               PaychanguCheckout({
//                 "public_key": "$publicKey",
//                 "tx_ref": "$txRef",
//                 "amount": 1000,
//                 "currency": "MWK",
//                 "callback_url": "https://yourapp.com/callbackurl",
//                 "return_url": "https://yourapp.com/returnurl",
//                 "customer": {
//                   "email": "yourmail@example.com",
//                   "first_name": "John",
//                   "last_name": "Doe"
//                 },
//                 "customization": {
//                   "title": "Ride Payment",
//                   "description": "Pay for your ride"
//                 },
//                 "meta": {
//                   "uuid": "some-unique-identifier"
//                 }
//               });
//             }

//             // Automatically trigger the payment form when page loads
//             makePayment();
//           </script>
//         </body>
//       </html>
//     ''';

//     _webViewController.loadUrl(
//       Uri.dataFromString(
//         htmlContent,
//         mimeType: 'text/html',
//         encoding: Encoding.getByName('utf-8'),
//       ).toString(),
//     );
//   }

//   // Function to handle payment success
//   void _handlePaymentSuccess() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Payment Success'),
//         content: const Text('Your ride has been successfully booked.'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               Navigator.of(context).pop(); // Go back to previous screen
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//   // Function to handle payment error
//   void _handlePaymentError() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Payment Failed'),
//         content: const Text('There was an error processing your payment. Please try again.'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // Go back to previous screen
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
  
//   WebView({required String initialUrl, required javascriptMode, required Null Function(WebViewController webViewController) onWebViewCreated, required Null Function(String url) onPageFinished}) {}
// }

// extension on Random {
//   nextInt(int i) {}
// }

// class JavascriptMode {
//   static var unrestricted;
// }

// mixin WebViewController {
//   void loadUrl(String string) {}
// }
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';

import '../services/data.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Our Services'),
      ),);
  }
}