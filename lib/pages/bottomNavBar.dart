// ignore_for_file: file_names

import 'package:business/pages/Admin.Login.dart';
import 'package:flutter/material.dart';
import '../pages/markaet_page.dart';
import '../pages/service_Page.dart';
import '../pages/cart_page.dart';
import '../services/cart_service.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    const Center(
      child: Text(
        'Home',
        style: TextStyle(fontSize: 24, color: Colors.black),
      ),
    ),
    const ServicePage(),
    MarketPage(),
    const AdminLogin(),
    CartPage(cartService: CartService('http://127.0.0.1:3000')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page based on the index
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.green),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services, color: Colors.green),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, color: Colors.green),
            label: 'MarketPlace',
          ),
           BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart, color: Colors.green),
      label: 'Cart', // Add label for Cart
    ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.green),
            label: 'Admin',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
