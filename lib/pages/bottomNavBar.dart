// ignore_for_file: file_names

import 'package:business/pages/markaet_page.dart';
import 'package:flutter/material.dart';
import '../pages/Admin.Login.dart';
import '../pages/service_Page.dart';
import '../pages/cart_page.dart';
import '../services/cart_service.dart';
import '../pages/BusinessPage.dart';
//import '../pages/homepage.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // Initialize pages
    _pages = <Widget>[
      
       HomePage(),
      
       ServicePage(),
      MarketPage(),
      const AdminLogin(),
      CartPage(
        cartService: CartService('http://10.0.2.2:3000'), // Base URL
        userId: 1, 
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border(
            top: BorderSide(color: Colors.grey.shade800, width: 0.5),
          ),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.house,
                  color: _selectedIndex == 0 ? Colors.blue : Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings,
                  color: _selectedIndex == 1 ? Colors.blue : Colors.white),
              label: 'Services',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store,
                  color: _selectedIndex == 2 ? Colors.blue : Colors.white),
              label: 'MarketPlace',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: _selectedIndex == 3 ? Colors.blue : Colors.white),
              label: 'Admin',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,
                  color: _selectedIndex == 4 ? Colors.blue : Colors.white),
              label: 'My Cart',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white54,
          backgroundColor: Colors.black,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
        ),
      ),
    );
  }
}
